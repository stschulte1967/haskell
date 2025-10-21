module Main where
main = do
    print $ addOne 1
    print $ addOne 2
    print $ addOne 3
    print $ addTwo 1
    print $ addTwo 2
    print $ addTwo 3


uncurriedAddition = myUncurry (+)

addition :: Integer -> Integer -> Integer
addition = myCurry uncurriedAddition
addOne = addition 1
addTwo = addition 2

myCurry :: ((a, b) -> c) -> a -> b -> c
myCurry f a b = f (a, b)

myUncurry :: (a -> b -> c) -> (a, b) -> c
myUncurry f (a, b) = f a b