module Main where

-- Given n, yields the numbers in the spiral of width 2n+1
spiralNumbers :: Int -> [Int]
spiralNumbers 0 = [1]
spiralNumbers k =
  let n = 2*k + 1
      prev = 2*k - 1
   in spiralNumbers (k-1) ++ map (\i -> prev^2 + i*(prev+1)) [1..4]

main = print . sum $ spiralNumbers 500
