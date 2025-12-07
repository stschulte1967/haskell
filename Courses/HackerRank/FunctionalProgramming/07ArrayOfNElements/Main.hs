fn n = take n [1,2..]

main = do
    n <- readLn :: IO Int
    print (fn(n))