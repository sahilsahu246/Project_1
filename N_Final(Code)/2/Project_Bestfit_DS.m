function [art , gr ,tp] = Project_Bestfit_2(nvm,lambda1)
% nvm=40;
% lambda1=0.5;
flag=1;
IAT=(-1/lambda1)*log(rand);
min_sz=100;
max_sz=10000;
min_sp=1000;
max_sp=2000;
no_of_task=500:150:1100;
L1=length(no_of_task);
c1=0;
n_dl=zeros(1,L1); % number of task meet deadline 
avg_res_time=zeros(1,L1);
guarantee_ratio=zeros(1,L1);

for nt=500:150:1100
 
c1=c1+1;

vm_busy=zeros(1,nvm); % VM status
n_t=zeros(1,nvm); % no of tasks allocated to each VM
start_time=zeros(1,nt); % start time of task
fnsh_time=zeros(1,nt); %finish time of task t_i
res_time=zeros(1,nt);
et1=zeros(nt,nvm);
new_vm1=zeros(1,nvm);
EST1=zeros(nt,nvm);

%---------------task loaded from matfile-----------------------%

if ~exist(strcat('task_gen',num2str(nt),'.mat'),'file')
   [ a, sz, dl] = taskgen(lambda1,IAT,min_sz,max_sz,nt,min_sp,max_sp); % generate task with required parameters   
   % a= arrival_time sz=size_of_task  dl=deadline
   save(strcat('task_gen',num2str(nt),'.mat'),'a','sz','dl');
else
    load(strcat('task_gen',num2str(nt),'.mat'));
end
if ~exist(strcat('vm_sp',num2str(nvm),'.mat'),'file')
   vm_speed=min_sp+(rand(1,nvm).*(max_sp-min_sp)); % speed of VM in the range min and max speed
   save(strcat('vm_sp',num2str(nvm),'.mat'),'vm_speed');
else
    load(strcat('vm_sp',num2str(nvm),'.mat'));
end

%--------------------------------------------------------------%

[ sz1 , dl1 , a1 , pos ] = Priority_Task(a,sz,dl,nt,flag);
cost_vm = cost_calc(vm_speed);
[ et ] = matrix_gen(sz1,vm_speed);
EST = objective_func(cost_vm,et);

for i=1:nt
    [new_vm1 , p1]=sort(EST(i,:));
    for j1=1:size(new_vm1,2)
        et1(i,j1)=et(i,p1(j1));
    end
end

for i=1:nt
   EST1(i,:)=sort(EST(i,:));
end

for i=1:nt
        
        pp=find(vm_busy+et1(i,:)<dl1(i));
    
        if ~isempty(pp)
          for c=1:size(pp,2)  
            [min_val , p]=min(EST1(i,(pp(1):pp(end))));
            min1=pp(p);
            start_time(i)=max(vm_busy(min1),a1(i));
            fnsh_time(i)=start_time(i)+et1(i,min1);
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
guarantee_ratio(1,c1)=(n_dl(1,c1)/nt);

end

art=avg_res_time;
gr=guarantee_ratio;
tp=n_dl;
% figure;plot(no_of_vm,smooth(art));title('Average Response Time');hold on;
% figure;plot(no_of_vm,smooth(gr));title('Guarantee Ratio');
save('Project_Bestfit_2.mat','art','gr','tp');

end
