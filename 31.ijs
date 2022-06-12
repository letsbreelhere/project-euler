coins =: < 1 2 5 10 20 50 100 200

makeChange =: dyad define
  its =. (#&(>x)) each ;/ >:/~ >x
  if. y>0 do. +/ its (makeChange"0 0) y - > x else. y=0 end.
)

echo coins makeChange 200
exit''
