function [art , gr , tp] = Project_HEFT_3(nt,nvm)
% nvm=40;
% lambda1=0.5;
flag=1;
min_sz=100;
max_sz=10000;
min_sp=1000;
max_sp=2000;
no_of_lambda1=0.2:0.125:1.2;
L1=length(no_of_lambda1);
c1=0;
n_dl=zeros(1,L1); % number of task meet deadline 
avg_res_time=zeros(1,L1);
guarantee_ratio=zeros(1,L1);


for lambda1=0.2:0.125:1.2

IAT=(-1/lambda1)*log(rand);    
c1=c1+1;

vm_busy=zeros(1,nvm); % VM status
n_t=zeros(1,nvm); % VM st
start_time=zeros(1,nt); % start time of task
fnsh_time=zeros(1,nt); %finish time of task t_i   
res_time=zeros(1,nt);
begin=zeros(nt,nvm);
endd=zeros(nt,nvm);

%---------------task loaded from matfile-----------------------%

% if ~exist(strcat('task_gen',num2str(nt),'.mat'),'file')
[ a, sz, dl] = taskgen(lambda1,IAT,min_sz,max_sz,nt,min_sp,max_sp); % generate task with required parameters   
   % a= arrival_time sz=size_of_task  dl=deadline
%    save(strcat('task_gen',num2str(nt),'.mat'),'a','sz','dl');
% else
%     load(strcat('task_gen',num2str(nt),'.mat'));
% end
if ~exist(strcat('vm_sp',num2str(nvm),'.mat'),'file')
   vm_speed=min_sp+(rand(1,nvm).*(max_sp-min_sp)); % speed of VM in the range min and max speed
   save(strcat('vm_sp',num2str(nvm),'.mat'),'vm_speed');
else
    load(strcat('vm_sp',num2str(nvm),'.mat'));
end

%--------------------------------------------------------------%

[ sz1 , dl1 , a1 , pos ] = Priority_Task(a,sz,dl,nt,flag);
% cost_vm = cost_calc(vm_speed);
[ et ] = matrix_gen(sz1,vm_speed);
% EST = objective_func(cost_vm,et);


for i=1:nt
    
        pp1=find(vm_busy+et(i,:)<dl1(i));
        
        if ~isempty(pp1)
           for c=1:size(pp1,2)
              begin(i,c)=max(vm_busy(pp1(c)),a1(i));
              endd(i,c)=begin(i,c)+et(i,pp1(c));
              vm_busy(pp1(c))=endd(i,c);
           end
        end   
end

vm_busy=zeros(1,nvm); % VM status

for i=1:nt
    
        pp=find(vm_busy+et(i,:)<dl1(i));
        c2=1:size(pp,2);
        if ~isempty(pp)
           for c=1:size(pp,2)
               [min_val , p]=min(endd(i,(c2(1):c2(end))));
               min1=pp(p);
               start_time(i)=max(vm_busy(min1),a1(i));
               fnsh_time(i)=start_time(i)+et(i,min1);
               vm_busy(min1)=fnsh_time(i);
               n_t(min1)=n_t(min1)+1;
               res_time(i)=fnsh_time(i)-start_time(i);
               if ~isempty(vm_busy(min1))
                  n_dl(1,c1)=n_dl(1,c1)+1;
                  break;
               else
                  continue;
               end
           end          
        end
end
    
avg_res_time(1,c1)=sum(res_time)/nt;
guarantee_ratio(1,c1)=n_dl(1,c1)/nt;

end

art=avg_res_time;
gr=guarantee_ratio;
tp=n_dl;
% figure;plot(no_of_vm,smooth(art));title('Average Response Time');hold on;
% figure;plot(no_of_vm,smooth(gr));title('Guarantee Ratio');
save('Project_HEFT_3.mat','art','gr','tp','pos');

end


