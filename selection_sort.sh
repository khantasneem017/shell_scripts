
echo "Enert the num of element:"
read n
N=`expr $n - 1`
echo "Enter the elements"
read -a arr
M=`expr $N - 1`
echo "Array before sorting"
for i in `seq 0 $N`
do
	echo "${arr[$i]}"
done
for i in `seq 0 $M`	#pass
do
	I=`expr $i + 1`
	min=$i
	for j in `seq $I $N`
	do
		if [ ${arr[$j]} -lt ${arr[$min]} ]
		then
			let min=$j
		fi
	done
	#swapping
	let temp=${arr[$min]}
	let arr[$min]=${arr[$i]}
	let arr[$i]=$temp
done
echo "Sorted array"
for i in `seq 0 $N`
do
	echo -e "${arr[$i]} \t"
done

