module Lib
    ( mySqrt
    ) where

mySqrt :: Float -> Float
mySqrt x = until goodEnough improve x
    where
        goodEnough y = abs (y*y - x) < eps * x
        improve y = (y + x/y)/2
        eps = 0.000001
