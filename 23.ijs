NB. Brute force
divisorSum =: {{ +/ (#~ (~:&y)) /:~ ~. > */ each (0&~: # ]) each <"1 (}:}. #: i. 2^>:#q:y) # (1,q:y) }}"0

abundant =: divisorSum > ]

echo +/ (i. 28123) -. > ~. +/ each ,{ ;~ (#~ abundant) >: i. 28123
