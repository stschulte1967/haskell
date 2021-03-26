input = "3 2 4 6 5 7 8 0 1"

solve = sum . filter (\n -> mod n 2 == 1)

main = putStrLn . show . solve . map read . words $ input