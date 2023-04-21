k1 = 0.16;
k2 = 0.16;
y = 0;
x = 1;

tRange = 0:0.1:20;
tPrev = 0;

yValues = zeros(1,length(tRange));

for index=1:length(tRange)
    timeChange = tRange(index)-tPrev;
    
    x = x + (timeChange)*(-k2*(x-y));
    y = y + (timeChange)*(k2*(x-y)-k1*y);

    yValues(index) = y;
    tPrev = tRange(index);
end

plot(tRange, yValues, 'ko');
title("Back-and-Forth Diffusion")
xlabel('Time');
ylabel('Drug in Blood (mg/L)');

