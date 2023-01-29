function curX=bisection(iterates, startX, endX)
% calculates f(x)=6x+1-(arctan(x))^2 based on bisection
    biSoln = 0;
    for r=0:iterates
        curX = (startX+endX)/2;
        startX
        endX
        fStart = 6*startX + 1 - (atan(startX))^2
        biSoln = 6*curX + 1 - (atan(curX))^2
        fEnd = 6*endX + 1 - (atan(endX))^2
        if biSoln*fStart < 0
            endX = curX;
        elseif biSoln*fEnd < 0
            startX = curX;
        else
            end;
end;