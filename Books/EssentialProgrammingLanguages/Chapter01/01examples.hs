in_S :: Integer -> Bool
in_S 0 = True
in_S n = if (n - 3 < 0)  then False else (in_S (n - 3))
