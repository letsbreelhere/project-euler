NB. First slightly non-obvious method.
NB. Find the largest exponents of every prime factor in #s less than 20, then
NB. get the product.
exps =: (>./"1) |: _ q: >: i. 20
echo <. */ (p: i. $ exps) ^ exps
exit''
