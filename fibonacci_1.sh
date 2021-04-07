echo "Enter the range"
read a
read b
let f1=-1
let f2=1
let f3=0
echo "The fibonacci series up to $n terms is: "

while [ $f3 -lt $b  ]
do
	let f3=`expr $f2+$f1`
	if test $f3 -ge $a 
	then
		echo "$f3"
	fi
	let f1=$f2
	let f2=$f3
done
