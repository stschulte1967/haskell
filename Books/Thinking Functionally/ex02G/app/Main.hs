module Main (main) where

import Lib

main :: IO ()
main = putStrLn $ showDate (10, 12, 2013)
