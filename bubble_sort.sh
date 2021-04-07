echo "Enter the number of element:"
read n
N=`expr $n - 1`
echo "Enter the elements of array:"
read -a arr
echo "Array before sorting"
for i in `seq 0 $N`
do
	echo -e "${arr[$i]} \t"
done
M=`expr $N - 1`
for i in `seq 0 $M`
do
	I=`expr $M - $i`
	for j in `seq 0 $I`
	do
		J=`expr $j + 1`
		if [ ${arr[$j]} -gt ${arr[$J]} ]
		then
			#swapping
			let temp=${arr[$J]}
			let arr[$J]=${arr[$j]}
			let arr[$j]=$temp
		fi
	done
done
echo "Array after sorting"
for i in `seq 0 $N`
do
	echo -e "${arr[$i]}"
done
