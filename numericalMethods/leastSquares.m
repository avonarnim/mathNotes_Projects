function f = leastSquares()
% calculates cubic root based on halley's method

    valsTrue = zeros(101,1);
    valsApprox = zeros(101,1);


    startingVal = 0;
    for r=1:101
        valsTrue(r,1) = 0.05*sin(1000*startingVal)+0.5*cos(pi*startingVal)-0.4*sin(10*startingVal);
        valsApprox(r,1) = 0.05*(1000*startingVal-((1000*startingVal)^3)/6) + 0.5*(1-(((pi*startingVal)^2)/2)) - 0.4*(10*startingVal-(((10*startingVal)^3)/6));
        startingVal = startingVal + 0.01;

    plot(valsApprox, 'x--')
    hold on
    plot(valsTrue,'-*');
    xlabel('t')
    ylabel('Function value')
    end