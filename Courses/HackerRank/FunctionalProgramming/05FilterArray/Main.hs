input :: String
input = "3 10 9 8 2 7 5 1 3 0"

solve :: String -> String
solve input = let
                is = (map read . words) input
                b = head is :: Int
                xs = tail is
                res = filter (<b) xs
              in
                (unlines . map show) res

main :: IO ()
main = putStrLn $ solve input

