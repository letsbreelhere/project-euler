module Main where

import Control.Monad
import Data.Ratio ((%), numerator, denominator)
import Data.Ord (comparing)
import qualified Data.List as L
import Data.List ((\\))
import Data.Maybe (mapMaybe)

data OTree a = N a | B (a -> a -> Maybe a) (OTree a) (OTree a)

instance Show a => Show (OTree a) where
  show (N a) = show a
  show (B _ l r) = "(" ++ show l ++ ";" ++ show r ++ ")"

reduce :: OTree a -> Maybe a
reduce (N a) = Just a
reduce (B o l r) = join $ o <$> reduce l <*> reduce r

up :: (a -> a -> a) -> a -> a -> Maybe a
up o x y = Just (o x y)

rDiv :: Rational -> Rational -> Maybe Rational
rDiv n d = if d == 0 then Nothing else Just (n / d)

ops :: [Rational -> Rational -> Maybe Rational]
ops = [up (+), up (-), rDiv, up (*)]

nodes :: OTree a -> [a]
nodes (N a) = [a]
nodes (B _ l r) = nodes l ++ nodes r

genTrees :: Eq a => Int -> [a -> a -> Maybe a] -> [a] -> [OTree a]
genTrees 0 _ _ = []
genTrees 1 _ xs = N <$> xs
genTrees _ _ [] = []
genTrees n os xs = do
  o <- os
  n' <- [1..n-1]
  l <- genTrees n' os xs
  let xs' = xs \\ nodes l
  r <- genTrees (n-n') os xs'
  pure $ B o l r

inserts :: a -> [a] -> [[a]]
inserts x [] = [[x]]
inserts x (y:ys) = (x:y:ys) : map (y:) (inserts x ys)

perms :: [a] -> [[a]]
perms [] = [[]]
perms (x:xs) = do
  p <- perms xs
  inserts x p

results :: [Rational] -> [Integer]
results =  map numerator . L.sort . L.nub . filter (\n -> n > 0 && denominator n == 1) . mapMaybe reduce . genTrees 4 ops

chooseIncr :: Ord a => Int -> [a] -> [[a]]
chooseIncr 0 _ = [[]]
chooseIncr n xs | n > length xs = []
chooseIncr n (x:xs) = map (x:) (chooseIncr (n-1) xs) ++ chooseIncr n xs

longestRunOf :: Eq a => a -> [a] -> Int
longestRunOf x xs = go xs x 0
  where go [] _ n = n
        go (y:ys) x n = if x == y then go ys x (n+1) else n

runLength :: [Rational] -> Int
runLength = succ . longestRunOf 1 . (zipWith (-) <$> tail <*> id) . results

main :: IO ()
main = putStrLn . concatMap (show . numerator) . L.maximumBy (comparing runLength) $ chooseIncr 4 [1..9]
