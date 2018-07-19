function [ cost_vm ] = cost_calc(vm)

cost_vm=zeros(1,length(vm));

for i=1:length(vm)
    if vm(i)>1800
        cost_vm(i)=3000+(vm(i)*0.75);
    elseif vm(i)>1500
        cost_vm(i)=2000+(vm(i)*0.5);
    else
        cost_vm(i)=1000+(vm(i)*0.25);
    end
end

end