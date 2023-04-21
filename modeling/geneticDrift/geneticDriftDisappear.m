simulations = 5000;

timeToHomogeneity = zeros(1, simulations);

for sim=1:simulations
    N = 10;
    A = 5;
    timesteps = 0;
    while A ~= 0 && A ~= 10
        aMemberNew = binornd(1, A/N);
        aMemberDies = binornd(1, A/N);
    
        A = A - aMemberDies + aMemberNew;
        timesteps = timesteps + 1;
    end
    
    timeToHomogeneity(sim) = timesteps;
    
end

histogram(timeToHomogeneity, 50)
xlabel('Time steps')
ylabel('Frequency')
title('Time-till-genetic homogeneity')
subtitle('5000 simulations on a population of 10')

