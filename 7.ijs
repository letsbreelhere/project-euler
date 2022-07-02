echo p:10000 NB. lol

NB. But actually though
NB. *Extremely* lame first pass. Don't know a non-hacky way to count to the
NB. 10001st without listing them all currently.
NB. 150000 is an estimated bound using the PNT ¯\_(ツ)_/¯
isPrime =: 0&<@*./@(|~ (2&+@i.@<.@%:))
echo 10000 { 2, (#~ isPrime"0) 2+i.150000
exit''
