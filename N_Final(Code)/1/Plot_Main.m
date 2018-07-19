function [] = Plot_Main(value1,value2,value3)

no_of_vm=10:5:40;

figure;
bar([value1.art;value2.art;value3.art])
xlabel('Algo. Type');
ylabel('Values for Different VMs')
title('Average Responce Time');

figure;
bar([value1.gr;value2.gr;value3.gr])
xlabel('Algo. Type');
ylabel('Values for Different VMs')
title('Guarantee Ratio');

figure;
bar([value1.tp;value2.tp;value3.tp])
xlabel('Algo. Type');
ylabel('Values for Different VMs')
title('Throughput');

figure;
plot(no_of_vm,value1.art,'c--s',no_of_vm,value2.art,'m-d',no_of_vm,value3.art,'k-p');
xlabel('No of VM');
ylabel('Values for Different VMs')
title('Average Responce Time');
legend('BestFit','FirstFit','HEFT');

figure;
plot(no_of_vm,value1.gr,'c--s',no_of_vm,value2.gr,'m-d',no_of_vm,value3.gr,'k-p');
xlabel('No of VM');
ylabel('Values for Different VMs')
title('Guarantee Ratio');
legend('BestFit','FirstFit','HEFT');

figure;
plot(no_of_vm,value1.tp,'c--s',no_of_vm,value2.tp,'m-d',no_of_vm,value3.tp,'k-p');
xlabel('No of VM');
ylabel('Values for Different VMs')
title('Throughput');
legend('BestFit','FirstFit','HEFT');

end