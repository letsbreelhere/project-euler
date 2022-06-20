module Main where
import Data.List (intersect, (\\))
import Control.Arrow ((***))

type Rat = (Int, Int)

eq :: Rat -> Rat -> Bool
eq (a,b) (c,d) = a * d == b * c

cancel :: Rat -> [Rat]
cancel (a,b) =
  let digits = show a `intersect` show b
   in map (\d -> (read $ show a \\ [d], read $ show b \\ [d])) digits

fractions = (,) <$> [10..99] <*> [10..99]

main = do
  let fs = map fst . filter (\(f@(a,b),c) -> a < b && (a `mod` 10) /= 0 && any (eq f) c) . map (\p -> (p, cancel p)) $ fractions
      n = product $ map fst fs
      d = product $ map snd fs
  print $ d `div` gcd n d
