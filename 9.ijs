pairIndices =: (>.=]) %: (+/]) *: >:i.1000
pairs =: ((,&2@#)$]) (~:&0#]) ; pairIndices #"0 { (;]) (>:i.1000)
triples =: {{y, %: +/ *: y}}"1 pairs
echo >. */ ((1000=+/"1 triples) i. 1) { triples
exit''
