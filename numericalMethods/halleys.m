function newGuess = halleys(guess, a)
% calculates cubic root based on halley's method
    iterates = 1
    top = guess^3 - a;
    bottom = 3*guess^2;
    newGuess = guess - top/bottom;
    while abs(newGuess-guess) > 10^(-8)
        guess = newGuess
        top = guess^3 - a;
        bottom = 3*guess^2;
        newGuess = guess - top/bottom;
        iterates = iterates + 1
end