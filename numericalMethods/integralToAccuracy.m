function prod=integralToAccuracy(accuracy)
increments = 2;
larger = integralEX2(increments);
smaller = integralEX2(2*increments);
while abs(larger-smaller) > accuracy
    increments = 2*increments;
    larger = integralEX2(increments);
    smaller = integralEX2(2*increments);
prod = smaller;
end