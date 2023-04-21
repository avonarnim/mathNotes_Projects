
N = 10;
p = 0.3;
b = 0.3;
runs = 6;
% timesteps = N;
timesteps = 60;

for round=1:runs
    p = p+0.1;
%     b = b+0.1;
%     N = N + 10;
    infected = zeros(1, N);

    S = 1-1/N;
    I = 1/N;
    R = 0;
    for step=1:timesteps

        Sorig = S;
        Iorig = I;
        newSusceptibleProportion = exp(I*(log(1-p)))
        S = Sorig*newSusceptibleProportion
        I = Sorig*(1-newSusceptibleProportion) + b*Iorig
        R = R + (1-b)*Iorig
        infected(step) = R;

    end
    plot(1:timesteps, infected, 'DisplayName', strcat('p=',string(p)))
%     plot(1:timesteps, infected, 'DisplayName', strcat('b=',string(b)))
%     plot(1:timesteps, infected, 'DisplayName', strcat('N=',string(N)))
    hold on
end

lgd = legend('Location','southeast');
lgd.NumColumns = 2;
xlabel('Time Step')
ylabel('Total proportion infected')
title('Kermack McKendrick Variance with p value')
% title('Kermack McKendrick Variance with b value')
% title('Kermack McKendrick Variance with N value')
hold off