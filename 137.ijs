NB. Some algebra shows that A_F(x) (shortened as A) satisfies the equation:
NB. A*x^2 + (A+1)*x - A = 0.
NB. Thus golden nuggets are those integers whose determinants, (A+1)^2 + 4*A^2,
NB. i.e. 5*A^2 + 2*A + 1, are perfect squares.

NB. Cheating a bit, Alpertron (https://www.alpertron.com.ar/QUAD.HTM) gives the
NB. initial solutions (0, +/-1), (-1, +/-2), and (2,5), along with the
NB. recurrences:

NB. x_n+1 = - 9 ⁢x_n - 4 ⁢y_n - 2 ⁢
NB. y_n+1 = - 20 ⁢x_n - 9 ⁢y_n - 4 ⁢
NB.
NB. and:
NB.
NB. x_n+1 = - 9 ⁢x_n + 4 ⁢y_n - 2 ⁢
NB. y_n+1 = 20 ⁢n - 9 ⁢y_n +

NB. Iterating over these recurrences for all initial solutions and recurring
NB. gives a list of solutions, which we can sort to take the 15th (positive)
NB. solution.

recX1 =: {{ (_9*x) + (- 4*y) + _2 }}
recY1 =: {{ (_20*x) + (- 9*y) + _4 }}

recX2 =: {{ (_9*x) + (4*y) + _2 }}
recY2 =: {{ (20*x) + (- 9*y) + 4 }}

gen =: dyad define
  x1 =: x recX1 y
  y1 =: x recY1 y
  x2 =: x recX2 y
  y2 =: x recY2 y
  (x1,y1);(x2,y2)
)

s =: {{(*:y) - 1 2 5 p. x}}

init =: (0 1);(2 5);(0 _1);(_1 2);(_1 _2)

echo 14 { (#~ 0&<) /:~ ~. ;{. each ;{{{{,;(gen/ each) y}}^:y init}}"0 each ;/i.11
exit''
