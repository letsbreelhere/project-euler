divisors =: {{ |.>(;p:@i.@#) _ q: y }}

NB. Given a list of exponents, gives a table of all exponent combinations
NB. corresponding to proper divisors.
exps =: {{ >, { (<@0:`(i.@>:&.>) @. (>&0))"0 y }}

properDivisors =: */"1@(^"1 [: exps ])/@divisors
divSum =: +/@(-.~ properDivisors)
amicable =: (=~ divSum^:2) *. (~:~ divSum)

echo +/ (#~ amicable)"0] 2+i.9997
exit''
