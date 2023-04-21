day = [1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14];
sick = [3, 8, 28, 75, 221, 291, 255, 235, 190, 125, 70, 28, 12, 5];

% i0Likely = 3;
% aLikely = 0.0041;
% bLikely = 0.5229;


i0Likely = 3;
aLikely = 0.0026;
bLikely = .4767;

varInit = [i0Likely, aLikely, bLikely];
varFin = fminsearch(@calculateLoss, varInit)

newSickPredictions = zeros(1, length(sick));
i0 = varFin(1);
a = varFin(2);
b = varFin(3);
iCur = i0;
iPrev = 0;
sCur = 763-i0;
sPrev = 0;
for i=1:length(sick)
%         adding loss from iteration n
%         n ranges from 1-14
    newSickPredictions(i) = iCur;
    sPrev = sCur;
    iPrev = iCur;
%         now calculating iteration n+1 values
%         ranges from 2-15... 15 is not used
    sCur = sPrev*exp(-a*iPrev);
    iCur = sPrev*(1-exp(-a*iPrev))+b*iPrev;
end

plot(day, sick, 'ko', day, newSickPredictions, '*');
title('Spread of influenza in a school');
subtitle('Pop: 763');
xlabel('Day');
ylabel('Number Confined to Bed');
xlim([0,15])
ylim([0,300])

function loss=calculateLoss(vars)
    sick = [3, 8, 28, 75, 221, 291, 255, 235, 190, 125, 70, 28, 12, 5];
    i0 = vars(1);
    a = vars(2);
    b = vars(3);
    loss = 0;

    iCur = i0;
    iPrev = 0;
    sCur = 763-i0;
    sPrev = 0;

    for i=1:length(sick)
%         adding loss from iteration n
%         n ranges from 1-14
        loss = loss + (iCur-sick(i))^2;
        sPrev = sCur;
        iPrev = iCur;


%         now calculating iteration n+1 values
%         ranges from 2-15... 15 is not used

        sCur = sPrev*exp(-a*iPrev);
        iCur = sPrev*(1-exp(-a*iPrev))+b*iPrev;
    end
end