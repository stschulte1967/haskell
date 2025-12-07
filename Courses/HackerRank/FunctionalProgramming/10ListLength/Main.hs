len :: [a] -> Int
len [] = 0
len (_:xs) = 1 + len xs 

main = do
    inputdata <- getContents
    putStrLn $ show $ len $ map (read :: String -> Int) $ lines inputdata