digits =: 10&#.inv
ltrunc =: {{ *./ 1 p: (10#.;)"1 ,/\ <"0 digits y }}"0
rtrunc =: {{ *./ 1 p: (10#.;)"1 ,/\. <"0 digits y }}"0
(#~ (ltrunc*rtrunc)) p: i.1000

echo +/ (#~(ltrunc*rtrunc)) p: 4+i.1e5
exit''
