input = "5"

solve n = take n [0..]

main = print . solve . read $ input