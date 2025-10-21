module Lib
    ( song
    ) where

numbers_to_ten =      ["", "one", "two", "three", "four", "five", "six", "seven", "eight", "nine", "ten"]
numbers_to_ten_cap =  ["", "One", "Two", "Three", "Four", "Five", "Six", "Seven", "Eight", "Nine", "Ten"]

song :: Int -> String
song n = if n == 0 then "" else song (n - 1) ++ "\n" ++ verse n

verse :: Int -> String
verse n = line1 n ++ line2 n ++ line3 n ++ line4 n

line1 :: Int -> String
line1 n = numbers_to_ten_cap !! n ++ showMen n ++ "went to mow\n"

line2 :: Int -> String
line2 n = "Went to mow a meadow\n"

line3 :: Int -> String
line3 n = showListOfMenUpper n ++ " and his dog\n"

line4 :: Int -> String
line4 n = "Went to mow a meadow\n"

showMen :: Int -> String
showMen n = if n == 1 then " man " else " men "

showListOfMen :: Int -> String
showListOfMen 1   = "one man"
showListOfMen n   = numbers_to_ten !! n  ++ " men, " ++ showListOfMen (n - 1)

showListOfMenUpper :: Int -> String
showListOfMenUpper 1   = "One man"
showListOfMenUpper n   = numbers_to_ten_cap !! n  ++ " men, " ++ showListOfMen (n - 1)

