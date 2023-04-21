day = [1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14];
sick = [3, 8, 28, 75, 221, 291, 255, 235, 190, 125, 70, 28, 12, 5];

i0 = 3;
aLikely = 0.0026;

healthy = zeros(1, length(sick));
healthy(1)=763-i0;

for t=2:length(sick)
    healthy(t)=healthy(t-1)*exp(-aLikely*sick(t-1));
end

% Because we assume the values of s_1 and i_1, we will 
% only optimize over s_2:14 and i_2:14

healthyBase = healthy(1:length(healthy)-1);
healthyPlus = healthy(2:length(healthy));

sickBase = sick(1:length(sick)-1)
sickPlus = sick(2:length(sick))

newSickOptimizer = @(b) (healthyBase.*(1-exp(-aLikely*sickBase))+b*sickBase-sickPlus)
bInit = 1;
bFin = lsqnonlin(newSickOptimizer, bInit)
newSickPredictions = healthyBase.*(1-exp(-aLikely*sickBase))+bFin*sickBase

plot(day, sick, 'ko', day, cat(2, [3], newSickPredictions), '*');
title('Sickness in an influenza outbreak')
xlabel('Day');
ylabel('Number confined to bed');
