module Chapter2.Exercises where

ackerman :: (Num a, Num t, Ord a, Eq t) => a -> t -> t
ackerman m n | m == 0          = n + 1
             | m > 0 && n == 0 = ackerman (m-1) 1
             | otherwise       = ackerman (m-1) (ackerman m (n-1))

unzip :: [(a, b)] -> ([a], [b])
unzip xs = (map fst xs, map snd xs)
