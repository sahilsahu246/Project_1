function [ EST ] = objective_func( cost_vm , et )

EST1 = zeros(size(et,1),size(et,2));
EST2 = zeros(size(et,1),size(et,2));
EST = zeros(size(et,1),size(et,2));
min_cost_vm = min(cost_vm);
max_cost_vm = max(cost_vm);

for i=1:size(et,1)
    for j=1:size(et,2)
        EST1(i,j)=((cost_vm(j)-min_cost_vm)/(max_cost_vm-min_cost_vm));
        EST2(i,j)=((et(i,j)-min(et(:,j)))/(max(et(:,j))-min(et(:,j))));
        EST(i,j)=0.5*(EST1(i,j))+0.5*(EST2(i,j));
    end
end

end

