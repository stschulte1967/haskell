module Main (main) where
import System.Win32 (xBUTTON1)

myExp :: Integer -> Integer -> Integer
myExp x n | n == 0 = 1
        | n == 1 = x
        | even n = myExp x (div n 2) ^ 2
        | odd  n = x * myExp x (div (n-1) 2) ^ 2

main :: IO ()
main = print $ myExp 4 3

