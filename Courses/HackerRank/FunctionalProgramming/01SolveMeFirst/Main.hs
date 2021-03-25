testdata = "2 3"

main =  print (solve testdata)
    
solve = show . sum . map read . words

-- commited solution: 
--   main = interact $ show . sum . map read . words