f :: Int -> [Int] -> [Int]
f n = filter (< n)

-- This part deals with the Input and Output and can be used as it is. Do not modify it.
main = do 
    n <- readLn :: IO Int 
    inputdata <- getContents 
    let 
        numbers = map read (lines inputdata) :: [Int] 
    putStrLn . unlines $ (map show . f n) numbers

