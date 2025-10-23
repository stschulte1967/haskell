module Main where

main = print $ countdown 10

countdown :: Int -> [Int]
countdown 0 = []
countdown n = n:countdown (n-1)