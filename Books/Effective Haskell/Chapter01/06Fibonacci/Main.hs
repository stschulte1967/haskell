module Main where
main = do
    print $ fibonacci 0
    print $ fibonacci 1
    print $ fibonacci 5
    print $ fibonacci 10
    print $ fibonacci 25


fibonacci :: Integer -> Integer
fibonacci 0 = 0
fibonacci 1 = 1
fibonacci n = fibonacci (n - 1) + fibonacci (n - 2)