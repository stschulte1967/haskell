module Main where
main = do
    print $ factorial 1
    print $ factorial 3
    print $ factorial 5
    print $ factorial 10
    print $ factorial 25


factorial :: Integer -> Integer
factorial 0 = 1
factorial 1 = 1
factorial n = n * factorial (n - 1)