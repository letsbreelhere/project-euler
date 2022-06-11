module Main where

-- Given n, yields the numbers in the spiral of width 2n+1
-- Basic idea: for the 1x1 case return [1]. For the 3x3 case take the next 4 odd
-- numbers after 1 (adding 2) up to 9, for 5x5 take every other odd number
-- after 9 (adding 4) up to 25, etc.
spiralNumbers :: Int -> [Int]
spiralNumbers 0 = [1]
spiralNumbers k =
  let n = 2*k + 1
      prev = 2*k - 1
   in spiralNumbers (k-1) ++ map (\i -> prev^2 + i*(prev+1)) [1..4]

main = print . sum $ spiralNumbers 500
