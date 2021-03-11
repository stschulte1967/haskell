module WC where

main = interact wordCountCharacterCount 
           where 
                wordCountCharacterCount  input = show (length (lines input)) ++ " " ++ show (length input) ++ "\n"


