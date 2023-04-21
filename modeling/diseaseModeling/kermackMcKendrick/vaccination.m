
N = 50;
p = 0.3;
b = 0.5;
c = 0.5;
timesteps = N;
infected = zeros(1, N);

ImO = 0;    % means i n-minus-one
S = 1-1/N;
I = 1/N;
R = 0;
for step=1:timesteps

    Sorig = S;
    In = I;
    negA = log(1-p);
    newSusceptibleProportion = exp(negA*(In-c*b*ImO));
    S = Sorig*newSusceptibleProportion
    I = Sorig*(1-newSusceptibleProportion) + b*In
    R = R + (1-b)*In
    ImO = In;
    infected(step) = R;

end
plot(1:timesteps, infected, 'DisplayName', strcat('Quar: c: ', string(c)))
hold on


runs = 3
d = 0.65;
e = 0.5;

for round=1:runs
    d = d+0.1;
    e = e-0.1;
    infected = zeros(1, N);

    S = 1-1/N;
    I = 1/N;
    R = 0;
    for step=1:timesteps
    
        Sorig = S;
        In = I;
        negA = log(1-p);
        newSusceptibleProportion = exp(negA*In);
        S = Sorig*newSusceptibleProportion
        I = Sorig*(1-newSusceptibleProportion) + ((1-d)*b+d*e)*In
        R = R + ((1-d)*(1-b)+d*(1-e))*In
        infected(step) = R;
    
    end
    plot(1:timesteps, infected, 'DisplayName', strcat('Vacc: d: ', string(d), ', e: ', string(e)))
    hold on
end


lgd = legend('Location','southeast');
xlabel('Time Step')
ylabel('Total proportion infected')
title('Quarantining v.s. Vaccination')
hold off



