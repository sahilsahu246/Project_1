function [ s ] = matrix_gen(sz,sp)

for i=1:size(sz,2)
    for j=1:size(sp,2)
        s(i,j)=sz(i)/sp(1,j);% Execution time of task t_i in VM vm_j 
%         p(i,j)=1/size(sp,2);%Probability of assigning t_i to vm_j
    end
end

end



