function [] = Plot_Main_3(value1,value2,value3,value4,value5,value6)

no_of_lambda1=0.2:0.125:1.2;

figure;
bar([value1.art;value2.art;value3.art;value4.art;value5.art;value6.art])
xlabel('Algo. Type');
ylabel('Values for Different lambda')
title('Average Responce Time');

figure;
bar([value1.gr;value2.gr;value3.gr;value4.gr;value5.gr;value6.gr])
xlabel('Algo. Type');
ylabel('Values for Different lambda')
title('Guarantee Ratio');

figure;
bar([value1.tp;value2.tp;value3.tp;value4.tp;value5.tp;value6.tp])
xlabel('Algo. Type');
ylabel('Values for Different lambda')
title('Throughput');

figure;
plot(no_of_lambda1,value1.art,'c--s',no_of_lambda1,value2.art,'m-d',no_of_lambda1,value3.art,'k-p',no_of_lambda1,value4.art,'r--s',no_of_lambda1,value5.art,'b-d',no_of_lambda1,value6.art,'g-p');
xlabel('lambda');
ylabel('Values for Different lambda')
title('Average Responce Time');
legend('BestFit_3','FirstFit_3','HEFT_3','BestFit_three','FirstFit_three','HEFT_three');

figure;
plot(no_of_lambda1,value1.gr,'c--s',no_of_lambda1,value2.gr,'m-d',no_of_lambda1,value3.gr,'k-p',no_of_lambda1,value4.gr,'r--s',no_of_lambda1,value5.gr,'b-d',no_of_lambda1,value6.gr,'g-p');
xlabel('lambda');
ylabel('Values for Different lambda')
title('Guarantee Ratio');
legend('BestFit_3','FirstFit_3','HEFT_3','BestFit_three','FirstFit_three','HEFT_three');

figure;
plot(no_of_lambda1,value1.tp,'c--s',no_of_lambda1,value2.tp,'m-d',no_of_lambda1,value3.tp,'k-p',no_of_lambda1,value4.tp,'r--s',no_of_lambda1,value5.tp,'b-d',no_of_lambda1,value6.tp,'g-p');
xlabel('lambda');
ylabel('Values for Different lambda')
title('Throughput');
legend('BestFit_3','FirstFit_3','HEFT_3','BestFit_three','FirstFit_three','HEFT_three');

end