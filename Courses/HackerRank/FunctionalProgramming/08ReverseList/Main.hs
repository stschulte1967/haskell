input = "19 22 3 28 26 17 18 4 28 0"

solve = reverse 

main = (putStrLn . unlines . solve . words) input