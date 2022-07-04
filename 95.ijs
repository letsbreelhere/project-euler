NB. Algorithm from https://softwareengineering.stackexchange.com/a/264065
divSum =: monad define
  if. y = 0
    do. 0
    else. y -~ */ > ([: +/ [: */\ 1&,) each </.~ q: y
  end.
)

NB.sums =: divSum"0 >: i. 1e6

chainP =: dyad define
  if. (y < 2) +. y > 1e6 do. ;a:
    elseif. (y e. x) *. ({. x) = divSum ({: x) do. x
    elseif. (y e. x) *. -. ({. x) = divSum ({: x) do. ;a:
    else. (,x,y) chainP divSum y
    end.
)

chain =: ((;a:)&chainP)"0

echo {.>{. (\: ({:@>)) (#~ (*@{:@>))"1 (<./,#) each chain each <"0 >: i. 100000
exit''
