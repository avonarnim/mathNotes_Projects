
N = 20;
p = 0.05;
runs = 10;

finalNvals = zeros(1, runs);

for round=1:runs
    S = N-1;
    I = 1;
    R = 0;
    for step=1:N

        exchanged = binornd(S, (1-(1-p)^I));
        R = I + R;
        I = exchanged;
        S = S-exchanged;

    end
    finalNvals(round) = R;
end

histogram(finalNvals, 30)
xlabel('Total people infected')
ylabel('Frequency')
title('Total infected population over 5000 experiments')