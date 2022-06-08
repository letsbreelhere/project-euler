module Main where

import Data.List ((\\), find, sort)
import Control.Applicative

perms :: Eq a => [a] -> [[a]]
perms [] = [[]]
perms xs = do
  e <- xs
  ys <- perms (xs \\ [e])
  pure (e : ys)

fact = product . enumFromTo 1

facts = zip [0..] $ map fact [0..]

setIndex :: Int -> a -> [a] -> [a]
setIndex i _ xs | i >= length xs = error ("Cannot set index " ++ show i ++ " on list of length " ++ show (length xs))
setIndex i x xs = take i xs ++ [x] ++ drop (i+1) xs

swapIndices :: Int -> Int -> [a] -> [a]
swapIndices i j xs =
  let x = xs !! i
      y = xs !! j
   in (setIndex i y . setIndex j x) xs

sortLast :: (Ord a) => Int -> [a] -> [a]
sortLast k xs = take (length xs - k) xs ++ sort (drop (length xs - k) xs)

findLast :: (a -> Bool) -> [a] -> Maybe a
findLast _ [] = Nothing
findLast p (x:xs)
  | p x = findLast p xs <|> Just x
  | otherwise = Nothing

lexPerm :: Int -> [Int] -> [Int]
lexPerm 0 xs = xs
lexPerm n xs =
  let Just (maxDigit, maxFact) = findLast (\(i, fi) -> fi <= n) facts
      len = length xs
      ixToChange = len - maxDigit - 1
      replacementIx = ixToChange + n `div` maxFact
      xs' = sortLast maxDigit $ swapIndices replacementIx ixToChange xs
   in lexPerm (n `mod` maxFact) xs'

main :: IO ()
main = putStrLn . concatMap show $ lexPerm 999999 [0..9]
