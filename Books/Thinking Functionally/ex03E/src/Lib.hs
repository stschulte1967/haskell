module Lib
    ( isqrt
    ) where

isqrt :: Integer -> Integer
isqrt n | n < 0 = error "isqrt is only defined for positive integers"
isqrt x = fst (until unit (shrink x) (-1,x))
    where 
        unit (m,n) = m + 1 == n 
        shrink (m,n) =  if m*m < x   
