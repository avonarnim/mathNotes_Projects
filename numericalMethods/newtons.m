function newGuess = newtons(guess)
% calculates f(x)=6x+1-(arctan(x))^2 based on newton's method
    iterates = 1
    top = 6*guess + 1 - (atan(guess))^2;
    bottom = 6 - 2*atan(guess)/(1+guess^2);
    newGuess = guess - top/bottom;
    while abs(newGuess-guess) > 10^(-12)
        guess = newGuess
        top = 6*guess + 1 - (atan(guess))^2;
        bottom = 6 - 2*atan(guess)/(1+guess^2);
        newGuess = guess - top/bottom;
        iterates = iterates + 1
end