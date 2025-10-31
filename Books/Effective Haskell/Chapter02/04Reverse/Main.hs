module Reverse where

myReverse :: [String] -> [String]
myReverse = foldl (flip (:)) []

myReverse' :: [String] -> [String]
myReverse' = foldr (\x acc -> acc <> [x]) []
