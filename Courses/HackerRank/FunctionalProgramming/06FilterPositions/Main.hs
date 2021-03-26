input = "2 5 3 4 6 7 9 8"

solve = (unlines . map (\(a, b) -> b) . filter (\(a,b) -> mod a 2 == 1) . zip [0..] . words)

main = putStrLn $ solve input
