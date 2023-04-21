xAxis= [0, 4.22, 11.91, 16.81, 21.95, 26.75, 31.44, 35.1, 38.8, 45.45, 54.36, 64.44, 73.78, 86.72, 101.51, 135.3];
yAxis  = 1:-1/15:0

plot(xAxis, yAxis, 'ko');
xlabel('Time');
ylabel('Height');

powerModelFunction = @(b,x) (1-b(1).*x).^2;

powerModel = fitnlm(xAxis, yAxis, powerModelFunction, [1])
xx = linspace(0,150)';
line(xx, predict(powerModel, xx), 'linestyle', '--', 'color', 'k')

expModelFunction = @(c,x) 1*(exp(c(1).*x));

exponentialModel = fitnlm(xAxis, yAxis, expModelFunction, [1])
line(xx, predict(exponentialModel, xx), 'linestyle', ':', 'color', 'k')


