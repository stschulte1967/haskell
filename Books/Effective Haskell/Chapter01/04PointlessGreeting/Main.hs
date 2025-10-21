module Main where

makeGreeting = (<>) . (<> " ")

main = print $ makeGreeting "Hello" "Gerd"