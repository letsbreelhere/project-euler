ps =: p: i. p:inv 4 p: 1e6
circular =: {{ */ 1 p: ((i.@#) |."0 _ ]) &.(10&#.inv) y }}"0
echo +/circular ps
exit''
