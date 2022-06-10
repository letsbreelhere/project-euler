module Main where

import Data.Foldable (maximumBy)
import Data.Ord (comparing)

expandReciprocal :: Int -> [Int]
expandReciprocal n = map snd $ takeUntilRepeat $ expandReciprocal' 10 n

expandReciprocal' :: Int -> Int -> [(Int, Int)]
expandReciprocal' p q =
  let quotient = p `quot` q
      remainder = p `rem` q
   in (p, quotient) : expandReciprocal' (remainder * 10) q

takeUntilRepeat :: Eq a => [a] -> [a]
takeUntilRepeat [] = []
takeUntilRepeat (x:xs) = takeUntilRepeat' xs []

takeUntilRepeat' [] ys = reverse ys
takeUntilRepeat' (x':xs) ys
  | x' `elem` ys = reverse ys
  | otherwise = takeUntilRepeat' xs (x':ys)

cycleLength :: Int -> Int
cycleLength = length . expandReciprocal

main :: IO ()
main = print . fst . maximumBy (comparing snd) $ zip [1..1000] (map cycleLength [1..1000])
