function prod=integralEX2(intervals)
prod = 0;
increment = 1/intervals;
for r=0:increment:1
    l = r-increment;
    fl = exp(-1*(l)^2);
    fr = exp(-1*(r)^2);
    prod = prod+(1/2)*(increment)*(abs(fr-fl))+(increment)*(min(fl, fr));
end;