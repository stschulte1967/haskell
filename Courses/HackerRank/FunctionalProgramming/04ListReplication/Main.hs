input = "3 1 2 3 4"

main = putStrLn $ solve input

solve inp = let
                xs = (map read . words) inp
                s = head xs
                is = tail xs
                res = map (\x -> take s ( repeat x)) is
            in
                (unlines . map show . concat) res 

-- sumbitted code:
-- interact $ solve