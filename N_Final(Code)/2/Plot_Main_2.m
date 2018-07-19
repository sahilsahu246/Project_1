function [] = Plot_Main_2(value1,value2,value3,value4,value5,value6)

no_of_task=500:150:1100;

figure;
bar([value1.art;value2.art;value3.art;value4.art;value5.art;value6.art])
xlabel('Algo. Type');
ylabel('Values for Different no. of Tasks')
title('Average Responce Time');

figure;
bar([value1.gr;value2.gr;value3.gr;value4.gr;value5.gr;value6.gr])
xlabel('Algo. Type');
ylabel('Values for Different no. of Tasks')
title('Guarantee Ratio');

figure;
bar([value1.tp;value2.tp;value3.tp;value4.tp;value5.tp;value6.tp])
xlabel('Algo. Type');
ylabel('Values for Different no. of Tasks')
title('Throughput');

figure;
plot(no_of_task,value1.art,'c--s',no_of_task,value2.art,'m-d',no_of_task,value3.art,'k-p',no_of_task,value4.art,'r--s',no_of_task,value5.art,'b-d',no_of_task,value6.art,'g-p');
xlabel('No of VM');
ylabel('Values for Different no. of Tasks')
title('Average Responce Time');
legend('BestFit_2','FirstFit_2','HEFT_2','BestFit_two','FirstFit_two','HEFT_two');

figure;
plot(no_of_task,value1.gr,'c--s',no_of_task,value2.gr,'m-d',no_of_task,value3.gr,'k-p',no_of_task,value4.gr,'r--s',no_of_task,value5.gr,'b-d',no_of_task,value6.gr,'g-p');
xlabel('No of VM');
ylabel('Values for Different no. of Tasks')
title('Guarantee Ratio');
legend('BestFit_2','FirstFit_2','HEFT_2','BestFit_two','FirstFit_two','HEFT_two');

figure;
plot(no_of_task,value1.tp,'c--s',no_of_task,value2.tp,'m-d',no_of_task,value3.tp,'k-p',no_of_task,value4.tp,'r--s',no_of_task,value5.tp,'b-d',no_of_task,value6.tp,'g-p');
xlabel('No of VM');
ylabel('Values for Different no. of Tasks')
title('Throughput');
legend('BestFit_2','FirstFit_2','HEFT_2','BestFit_two','FirstFit_two','HEFT_two');

end