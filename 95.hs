module Main where

import Debug.Trace
import Data.List
import Data.Ord

properDivisors' :: Int -> [Int]
properDivisors' n = filter (\d -> n `mod` d == 0) [1..floor (sqrt $ fromIntegral n)]

divSumMemo n = (sum $ properDivisors' n) + (sum . map (div n) $ properDivisors' n) - n

divSums = map divSumMemo [0..]
divSum = (divSums !!)

chain' :: Int -> [Int] -> [Int]
chain' 0 cs = []
chain' 1 cs = []
chain' n _ | n > 1000000 = []
chain' n cs
  | n `elem` cs = if (divSum (head cs) == last cs) then cs else []
  | otherwise = chain' (divSum n) (n:cs)

chain n = traceShow n $ chain' n []

main :: IO ()
main = print . maximum . sortBy (comparing snd) . filter (\p -> snd p > 0) . map (\x -> (x, length $ chain x)) $ [1..1000000]
