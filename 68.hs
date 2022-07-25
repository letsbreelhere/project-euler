module Main where

import Data.List ((\\), nub, sort)
import Control.Monad (guard)
import Debug.Trace

choose :: Int -> [a] -> [[a]]
choose 0 xs = [[]]
choose n [] = []
choose n (x:xs) = chooseHead ++ choose n xs
  where chooseHead = do
          hs <- choose (n-1) xs
          pure (x:hs)

perms :: Eq a => [a] -> [[a]]
perms [] = [[]]
perms xs = do
  e <- xs
  ys <- perms (xs \\ [e])
  pure (e : ys)

begin = concatMap perms $ choose 3 [1..10]

final :: Int -> [a] -> [a]
final n xs = drop (length xs - n) xs

next :: [[Integer]] -> [[Integer]]
next prev = filter (not . null) . nub . concat $ do
  p <- prev
  let [a,b,c] = final 3 p
  [d,e] <- choose 2 ([1..10]\\p)
  guard (a + b + c == d + c + e)
  pure [ if head p < d then p ++ [d,e] else []
       , if head p < e then p ++ [e,d] else []
       ]

--tenth :: [[Integer]] -> [[Integer]]
tenth iss = do
  is <- iss
  let j = head $ [1..10] \\ is
  guard $ head is < j
  guard $ (j + last is + (is !! 1)) == sum (take 3 is)
  pure (is ++ [j])

brute = do
  p <- perms [1..10]
  guard $ all (\i -> head p < (p !! i)) [3,5,7,9]
  traceShow p [()]
  let trips = map (map (p!!)) [[0,1,2],[2,3,4],[4,5,6],[6,7,8],[8,9,1]]
  guard $ all (== sum (head trips)) (map sum trips)
  pure p

bruteSolution = last . sort . map (read :: String -> Integer) . filter (\s -> length s == 16) . map (concatMap show) $ map (\p -> map (p!!) [0,1,2,3,2,4,5,4,6,7,6,8,9,8,1]) brute

finesseSolution = last . sort . map (read :: String -> Integer) . filter (\s -> length s == 16) . map (concatMap show) $ map (\p -> map (p!!) [0,1,2,3,2,4,5,4,6,7,6,8,9,8,1]) $ tenth $ iterate next begin !! 3

main :: IO ()
main = print finesseSolution
