xAxis = [0, 2.53, 5.19, 8.22, 11.48, 15.69, 20.32, 26.82, 32.49, 38.14, 47.36, 55.8, 65.41, 77.99, 93.54, 94.84];
yAxis = 1:-1/15:0;

plot(xAxis, yAxis, 'ko');
xlabel('Time');
ylabel('Height');

kOptions = 0.005:0.0005:0.03;
H=1;

minError = sum(xAxis.^2)
bestK = 0;
bestTimePredictions = zeros(length(xAxis), 1);

errors = zeros(length(xAxis), 1);

% iterate through options for k to find minimum error
for index=1:length(kOptions)
    k = kOptions(index);
    A = (2*k)^2;
    timePredictions = zeros(length(yAxis), 1);

%     get prediction values
    for dataPoint=1:length(yAxis)
        height = yAxis(dataPoint);
        time = timePredictor(height, A, H, k);
        timePredictions(dataPoint) = time;
    end

%     calculate error

    error = sum((transpose(timePredictions)-xAxis).^2)
    errors(index) = error
    if minError > error
        bestK = k;
        bestTimePredictions = timePredictions;
        minError = error;
    end
end

bestK
line(bestTimePredictions, yAxis, 'linestyle', '--', 'color', 'k')

% opens new figure
figure()
plot(kOptions, errors, 'ko');
xlabel('k Value');
ylabel('Error');


function [time] = timePredictor(height, A, H, k)
    if height > H/2
        time = (3/(2*A))^0.5 - (2*height/A - 1/(2*A))^0.5;
    else
        time = (1 - height^0.5) / k;
    end
end


