NB. This is just a binomial coefficient but let's actually compute it
addRow =: , (<@(+/\@>@{:))
echo (< 20 20) { > addRow^:21 (< 21#1)
exit''
