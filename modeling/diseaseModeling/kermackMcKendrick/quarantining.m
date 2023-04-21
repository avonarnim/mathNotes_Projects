
N = 100;
p = 0.3;
b = 0.3;
c = 0.0;
timesteps = N;
infected = zeros(1, N);
runs = 5;

for round=1:runs
    c = c+0.2;
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
    plot(1:timesteps, infected, 'DisplayName', strcat('Quarantining:', string(c)))
    hold on
end

lgd = legend('Location','southeast');
lgd.NumColumns = 2;
xlabel('Time Step')
ylabel('Total proportion infected')
title('Kermack McKendrick with Quarantining')
hold off