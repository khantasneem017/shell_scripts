echo "obase=2; $c2" | bc
echo "Enter the decimal number"
read num
let final=$(echo "obase=2; $num" |bc)
#let rem=1
#bno=" "
#while [ $num -gt 0 ]
#do
#let rem=`expr $num % 2 `
#bno=$bno$rem
#let num=`expr $num / 2 `
#done
#	i=${#bno}
#	final=" "
#	while [ $i -gt 0 ]
#	do
#	rev=`echo $bno | awk '{ printf substr( $0,'$i',1 ) }'`
#	final=$final$rev
#	i=$(( $i - 1 ))
#done
echo "Equivalent Binary no:" $final
binary=$final
c1=$(tr 01 10 <<< $binary)
c=$((echo "obase=2; ibase=2; $c1 + 1" |bc))
echo "2's complement of $num"
#c2=$((2#$c))
#c2=$((echo "obase=10; ibase=2; $c" |bc))
echo $c2
#echo "obase=2; $c2" | bc
