clc
close all
clear

a = 8 ;
show =10000;
s= a*0.0002;
va = [-a:s:a] ;
message = randsample(va,10000);
levels = [2,4,8];
quantized = zeros(3,show);
errors =  zeros(3,show);
means =  zeros(1,3);
variance_practical =  zeros(1,3);
variance_Theoretical =zeros(1,3);
SQNR_Practical =  zeros(1,3);
SQNR_Theoretical = zeros(1,3);

for i=1:3
    delta = 2.*a/levels(i);
    [q,error]= quantize(message,levels(i),a,show);
    quantized(i,:)=q;
    errors(i,:)=error;
    means(i)=abs(mean(error))
    variance_practical(i) = var(error)
    variance_Theoretical(i) = (delta^2)/12
    SQNR_Practical(i) = a^2/variance_practical(i)
    SQNR_Theoretical(i)=3*(levels(i)^2)
end
stem(levels,means)
figure()
stem(levels,variance_practical,'ms','MarkerSize',20);
xlabel('number of levels');
ylabel('Variance of quantization error');
hold on 
stem(levels,variance_Theoretical)
legend('Practical Variance','theoritical Variance');
figure()
stem(levels,SQNR_Practical,'ms','MarkerSize',20)
xlabel('number of levels');
ylabel('SQNR');
hold on
stem(levels,SQNR_Theoretical)
legend('Practical SQNR','theoritical SQNR');