module Lib
    ( showDate
    ) where

type Date = (Int, Int, Int)

showDate :: Date -> String
showDate (d, m, y) = show d ++ showPostfix d ++ " " ++ months !! m ++ ", " ++ show y
    where
        showPostfix d | div d 10 == 1 = "th"
                      | mod d 10 == 1 = "st"
                      | mod d 10 == 2 = "nd"
                      | mod d 10 == 3 = "rd"
                      | otherwise     = "th"

        months = [undefined, "January", "February", "March", "April", "Mai", "June", "July", 
                             "August", "September", "October", "November", "December"]

