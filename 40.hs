module Main where

digits :: Integer -> [Integer]
digits n = map (read . (:[])) $ show n

champ :: [Integer]
champ = concatMap digits [1..]

cRem :: Integer -> (Integer, Integer)
cRem = cRem' 0
  where cRem' k n =
          let r = (k+1) * 10^k * 9
           in if n < r
                 then (n, k+1)
                 else cRem' (k+1) (n-r)

champAlg :: Integer -> Integer
champAlg n =
  let (m, k) = cRem n
      q = m `div` k
      r = m `mod` k
      n' = 10^(k-1) + q
   in digits n' !! fromIntegral r

main :: IO ()
main = print . product . map (champAlg . pred . (10^)) $ [0..6]
