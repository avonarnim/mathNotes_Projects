xAxis = [0, 2.53, 5.19, 8.22, 11.48, 15.69, 20.32, 26.82, 32.49, 38.14, 47.36, 55.8, 65.41, 77.99, 93.54, 94.84];
yAxis = 1:-1/15:0;

plot(xAxis, yAxis, 'ko');
xlabel('Time');
ylabel('Height');

A = 0.000223993129;
k = (A^0.5)/2;
H = 1;
timePredictions = zeros(length(yAxis),1);

for index=1:length(yAxis)
    height = yAxis(index);
    time = timePredictor(height, A, H, k);
    timePredictions(index) = time;
end

timePredictions
line(timePredictions, yAxis, 'linestyle', '--', 'color', 'k')


function [time] = timePredictor(height, A, H, k)
    if height > H/2
        time = (3/(2*A))^0.5 - (2*height/A - 1/(2*A))^0.5;
    else
        time = (1 - height^0.5) / k;
    end
end


