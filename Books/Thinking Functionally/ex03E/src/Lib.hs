module Lib
    ( isqrt
    ) where

isqrt :: Float -> Integer
isqrt x = fst (until unit (shrink x) (bound x))
    where
        unit :: (Integer, Integer) -> Bool
        unit (m,n) = m + 1 == n
        leq :: Integer -> Float -> Bool
        m `leq` x = fromInteger m <= x
        m `lt` x = m < fromInteger x
        shrink :: Float -> (Integer, Integer) -> (Integer, Integer)
        shrink x (m,n) = if (p * p) `leq` x then (p,n) else (m,p) where p = (m+n) `div` 2
        bound x = (0, until above (*2) 1)
            where above n = x `lt` (n*n)


