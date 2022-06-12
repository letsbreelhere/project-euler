module Main where

coins = [1, 2, 5, 10, 20, 50, 100, 200]

makeChange :: [Int] -> Int -> Int
makeChange _ 0 = 1
makeChange xs n = sum . map (\i -> makeChange (filter (<=i) xs) (n-i)) . filter (n>=) $ xs

main = print $ makeChange coins 200
