function y = sumprod(n)
    y=0;
    for r=1:n-1
        y=y+r*(r+1)
    end;