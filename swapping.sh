echo "Enter first number"
read a
echo "Enter second number"
read b
echo "Before swapping a is $a and b is $b"
#swapping
a=$((a+b))
b=$((a - b))
a=$((a-b))
echo "After swapping a is  $a and b is $b"


