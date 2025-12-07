module Lib
    ( isqrt
    ) where

type Interval = (Integer, Integer)

isqrt :: Float -> Integer
isqrt x = fst (until unit (shrink x) (bound x))
    where unit (m,n) = m + 1 == n

leq :: (Ord a, Num a) => Integer -> a -> Bool
m `leq` x = fromInteger m <= x
lt :: (RealFrac a1, Integral a2) => a1 -> a2 -> Bool
m `lt` x = floor m < x

shrink :: Float -> Interval -> Interval
shrink x (m,n) = if (p * p) `leq` x then (p,n) else (m,p)
    where p = (m + n) `div` 2

bound :: Float -> Interval
bound x = (0, until above (*2) 1)
    where above n = x `lt` (n*n)

