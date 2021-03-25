testInput = "4"

solve input = let
                n = read input
              in
                (unlines . take n . repeat) "Hello World"

main = putStrLn (solve testInput)

-- submitted solution:
-- interact $ solve
