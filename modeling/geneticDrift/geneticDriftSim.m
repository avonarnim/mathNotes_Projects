steps = 50;
simulations = 10;

aPopulation = zeros(1, steps+1);

for sim=1:simulations
    N = 10;
    A = 5;
    aPopulation(1) = A;
    for step=1:steps
    
        aMemberNew = binornd(1, A/N);
        aMemberDies = binornd(1, A/N);
    
        A = A - aMemberDies + aMemberNew;
        aPopulation(step+1) = A;
    
    end

    plot(0:steps, aPopulation)
    hold on
end

hold off
xlabel('Time step')
ylabel('Frequency of allele a in population')
title('Total A population over 10 simulations')

