# Iterative Algorithms.
# Floating Points

Floating points are an approximation. Computers, using binary numbers do not have an exact match.

Implication. Check abs(x - y) < .001, instead of x == y

## Example

1. We want to find the square root of 25.
We'll set the answer we're seeking to 25;

        x = 25



2. As I start to guess, how close I want my answer to be.
That is set by a variable called 'epsilon'

        epsilon = 0.01



3. Set how big my steps will be with my answer starting at 0, and adding increments of 0.1

        step = 0.1



4. initial guess value

        guess = 0.0

5. Keep track of number of guesses

        numGuesses = 0




6. Final answer will be stored in a variable

        answer = 0

## Bisection Search

## Newton-Raphson

