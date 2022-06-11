maxDigits =: >: ((10&^ > ((9^5)&*)) >: i. 10) i. 1
s =: 2 + i. 10^maxDigits
echo +/ ((s =  , {{+/ (^&5) "."0 ": y}}"0 ;"0 s)) # s
exit''
