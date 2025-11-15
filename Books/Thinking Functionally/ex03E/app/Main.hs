module Main (main) where

import Lib

main :: IO ()
main = do
    print $ isqrt 4
    print $ isqrt 25
    print $ isqrt 26

