module Lib
    ( valid, CIN
    ) where

type CIN = String

getDigit :: Char -> Int
getDigit c = read [c]

valid :: CIN -> Bool
valid xs =  sum (map getDigit (take 8 xs)) == read (drop 8 xs)  
