echo "Enter the number of elememts: "
read n
N=`expr $n - 1`

echo "Enter the elements in sorted order: "
read -a arr
echo "Enter the element to be searched: "
read item
#initializaton
low=0
flag=0
high=`expr $n - 1`
while [ $low -le $high ]  
do
	mid=$(echo "$(low + high) / 2" | bc -l)
	if [ $item -eq ${arr[$mid]} ]    #checking if item is less than mid value 
	then
		flag=1	#when item is equal to value
		break
	elif [ $item -lt ${arr[$mid]} ]  #checking if item is less than mid value
	then
		high=`expr $mid - 1`		  #cutting the array into half and search the item in the left half of the array.
		
	else
		low=`expr $mid + 1`		 #when item is greater than mid value, check the right half of the array.
	fi
done

	if [ $flag -eq 1 ]
	then
		echo -e "Search successful.\nItem found at position $(($mid+1))"
	else
		echo "Search unsuccessful"
	fi
