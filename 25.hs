module Main where

import Data.List (find)

fibs :: [Integer]
fibs = 1 : 1 : zipWith (+) fibs (tail fibs)

main :: IO ()
main = print . fmap fst . find (\(_,d) -> length (show d) == 1000) . zip [1..] $ fibs
