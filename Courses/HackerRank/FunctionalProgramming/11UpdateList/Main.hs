input = "2 -4 3 -1 23 -4 -54"

solve :: [Int] -> [Int]
solve = map (\x -> if x < 0 then negate x else x)

main = (putStrLn . unlines . map show . solve . map read . words) input
