strsplit=: #@[ }.each [ (E. <;.1 ]) ,
rawNames =: }. <;._2 fread 'data/names.txt'
names =: /:~ ({{2 * i. >. -: # y}} { ]) rawNames
score =: (+/ @: >:@('ABCDEFGHIJKLMNOPQRSTUVWXYZ'&i.))
echo +/ (>: i. # names) * > score &.> names
