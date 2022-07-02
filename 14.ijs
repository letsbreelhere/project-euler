NB. Brute force, no memoization
step =: (-:`(>:@(3&*))`1:)@.(1&=+2&|)
its =: (#@(step^:a:))"0 >:i.1e6
echo >: (i. >./) its
exit''
