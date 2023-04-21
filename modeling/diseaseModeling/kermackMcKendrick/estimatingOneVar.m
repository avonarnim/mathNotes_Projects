day = [1, 2, 3, 4];
sick = [3, 8, 28, 75];
healthy = zeros(1, length(sick));
healthy(1)=760;

for t=2:length(sick)
    healthy(t)=healthy(t-1)-(sick(t)-sick(t-1));
end

healthyBase = healthy(1:length(healthy)-1);
healthyPlus = healthy(2:length(healthy));

aVal = zeros(1, length(healthyBase));
for t=1:length(healthyBase)
    aVal(t) = -log(healthyPlus(t)/healthyBase(t))/sick(t);
end

aLikely = sum(aVal)/length(aVal)

