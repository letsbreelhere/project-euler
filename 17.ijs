singles =: a:, ;: 'one two three four five six seven eight nine ten eleven twelve thirteen fourteen fifteen sixteen seventeen eighteen nineteen'
tens =: ;: 'twenty thirty forty fifty sixty seventy eighty ninety'
sub3 =: singles, ,/ tens ,each/ 10{.singles
hundreds =: (,&'hundred') each 9{.}.singles
words =: (sub3 , ,/ hundreds ,each/ (a:, ('and'&,)each}. sub3)),<'onethousand'
echo #;words
exit''
