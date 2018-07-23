function [] = Plot_Main(value1,value2,value3,value4,value5,value6)

no_of_vm=20:5:40;

figure;
bar([value1.art;value2.art;value3.art;value4.art;value5.art;value6.art])
xlabel('Algo. Type');
ylabel('Values for Different VMs')
title('Average Responce Time');

figure;
bar([value1.gr;value2.gr;value3.gr;value4.gr;value5.gr;value6.gr])
xlabel('Algo. Type');
ylabel('Values for Different VMs')
title('Guarantee Ratio');

figure;
bar([value1.tp;value2.tp;value3.tp;value4.tp;value5.tp;value6.tp])
xlabel('Algo. Type');
ylabel('Values for Different VMs')
title('Throughput');

figure;
plot(no_of_vm,value1.art,'c--s',no_of_vm,value2.art,'m-d',no_of_vm,value3.art,'k-p',no_of_vm,value4.art,'r--s',no_of_vm,value5.art,'b-d',no_of_vm,value6.art,'g-p');
xlabel('No of VM');
ylabel('Values for Different VMs')
title('Average Responce Time');
legend('BestFit','FirstFit','HEFT','BestFit_one','FirstFit_one','HEFT_one');

figure;
plot(no_of_vm,value1.gr,'c--s',no_of_vm,value2.gr,'m-d',no_of_vm,value3.gr,'k-p',no_of_vm,value4.gr,'r--s',no_of_vm,value5.gr,'b-d',no_of_vm,value6.gr,'g-p');
xlabel('No of VM');
ylabel('Values for Different VMs')
title('Guarantee Ratio');
legend('BestFit','FirstFit','HEFT','BestFit_one','FirstFit_one','HEFT_one');

figure;
plot(no_of_vm,value1.tp,'c--s',no_of_vm,value2.tp,'m-d',no_of_vm,value3.tp,'k-p',no_of_vm,value4.tp,'r--s',no_of_vm,value5.tp,'b-d',no_of_vm,value6.tp,'g-p');
xlabel('No of VM');
ylabel('Values for Different VMs')
title('Throughput');
legend('BestFit','FirstFit','HEFT','BestFit_one','FirstFit_one','HEFT_one');

end