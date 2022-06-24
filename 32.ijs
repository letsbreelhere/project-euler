perms =: {{(i.!y) A. >:i.y}}

ps =: perms 9

pandigits =: dyad define
  l =. (10&#."1) x&{."1 ps
  r =. (10&#."1) (x + i. y)&{"1 ps
  p =. (10&#."1) ((x + y) + i. (9-x+y))&{"1 ps
  (p=l*r) # p
)

echo +/~.; pandigits/ each (4 1; 3 2)
