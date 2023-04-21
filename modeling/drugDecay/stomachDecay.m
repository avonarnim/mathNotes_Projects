k1 = 0.16;
k2 = 0.16;
y = 0;
x0 = 1;

tRange = 0:0.1:20;
tPrev = 0;

yValues = zeros(1,length(tRange));

for index=1:length(tRange)
    x=x0*exp(-k2*tRange(index));
    timeChange = tRange(index)-tPrev;
    
    yDeriv = k2*x-k1*y;
    y = y + (timeChange)*yDeriv;

    yValues(index) = y;
    tPrev = tRange(index);
end

plot(tRange, yValues, 'ko');
title("One-Way Stomach-to-Blood Transfer")
xlabel('Time');
ylabel('Drug in Blood (mg)');

