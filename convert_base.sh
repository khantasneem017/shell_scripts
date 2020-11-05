echo "Enter the input base"
read inbase
echo "Enter the output base"
read outbase
echo "Enter a number: "
read num

echo "The value of $num is: "
echo "obase= $outbase; ibase= $inbase; $num" | bc

