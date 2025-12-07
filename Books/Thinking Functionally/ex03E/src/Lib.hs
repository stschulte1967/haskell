module Lib
    ( isqrt
    ) where

isqrt :: Float -> Integer
isqrt x = fst (until unit (shrink x) (0, floor x))
    where
        unit :: (Integer, Integer) -> Bool
        unit (m,n) = m + 1 >= n
        leq :: Integer -> Float -> Bool
        m `leq` x = fromInteger m <= x
        shrink :: Float -> (Integer, Integer) -> (Integer, Integer)
        shrink x (m,n) = if (p * p) `leq` x then (p,n) else (m,p) where p = (m+n) `div` 2


