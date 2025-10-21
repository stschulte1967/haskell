module Lib
    ( modernise
    ) where

import Data.Char

modernise :: String -> String
modernise = unwords . map capitalize . words
    where
        capitalize [] = []
        capitalize (x:xs) = (toUpper x):xs
