module Main (main) where

import Data.Char

main :: IO ()
main = do
    putStrLn "Enter a string:"
    line <- getLine
    putStrLn $ if palindrome line then "Yes!" else "No!" 

palindrome :: String -> Bool
palindrome xs = fs == reverse fs
    where fs = map toLower . filter isAlpha $ xs
