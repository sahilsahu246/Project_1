function [ a, sz, dl ] = taskgen(lambda1,IAT,min_sz,max_sz,nt,min_sp,max_sp)

% ------------Arrrival time of tasks---------------%
a(1)=IAT;
for i=2:nt
%     a(i)=IAT;
  a(i)=a(i-1)+(-1/lambda1)*log(rand);
% IAT=4+(8-4)*rand; %inter arrival time between task 4 to 8 sec
end
for i=1:nt
    for j=1:nt
    if (a(i)-a(j)) <= 100
        a(i)=a(j);
        break;
    end
    end
end
%-------------Size of tasks-------------%
for i=1:nt
sz(i)=ceil(min_sz+(max_sz-min_sz)*rand);% size of task
end
% %------------Deadline of tasks---------------------%

for i=1:nt
dl(i)=a(i)+5*rand;
end
% for i=1:n_VM
% m_speed(i)=min_sp+(rand.*(max_sp-min_sp)); % speed of VM in the range min and max speed
% en(i)=200+(rand.*(400-200));%energy consumption of VMs.
% end
end