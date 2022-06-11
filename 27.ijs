as =: _999 + i. 1999
bs =: (#~ (1 p: |)) i. 1001

coeffs =: , { bs; as; 1
consecPrimes =: > {{+/ *./\ 1 p: y p. i. 80}} each coeffs
maxConsec =: >./ consecPrimes
echo */ ; (consecPrimes i. maxConsec) { coeffs
exit''
