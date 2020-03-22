function [ q ,error] = quantize( message , level , a ,show)

delta = 2*a/level;
xq=-a+delta/2:delta:a-delta/2;
q = zeros(1,show);
error = zeros(1,show);
for i= 1:show
    min=100;
    for j=1:length(xq)
        
        if((abs(message(i)-xq(j)))<min)
            error(i)=xq(j)-message(i);
            min=abs(message(i)-xq(j));
            q(i)=xq(j);

        end
    end
    
end

end

