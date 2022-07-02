NB. Awful bruteforce "fold"
NB. Takes ~80s(!!!) but at least the memory is constant-ish
NB.echo {. {{ ({.y + 1{y),(p:>:@{:y),(>:@{:y) }}^:{{ 2e6>1{y }}^:_ ] 0 2 0

NB. Takes 10ms but is basically cheating.
echo +/p:i.p:^:_1]2e6
exit''
