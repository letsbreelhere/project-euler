NB. Brute force
divisorSum =: {{ +/ }: */ |: (~. q: y) ^"1 >, { i. each ;/ >: (#/.~) q: y }}"0

abundant =: divisorSum > ]

echo +/ (i. 28123) -. > ~. +/ each ,{ ;~ (#~ abundant) }. >: i. 28123
exit''
