function newGuess = fixedPoint(guess)
% calculates f(x)=6x+1-(arctan(x))^2 based on fixed point iteration
    iterates = 1
    newGuess = -1+(atan(guess))^2;
    newGuess = newGuess / 6
    while abs(newGuess-guess) > 10^(-12)
        guess = newGuess
        newGuess = -1+(atan(guess))^2;
        newGuess = newGuess / 6
        iterates = iterates + 1
end