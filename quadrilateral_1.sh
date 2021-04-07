echo "Enter the 4 coordinates of a quadrilateral" 
echo "Enter the coordinate of point A"
read x1
read y1
echo "Enter the coordinate of point B"
read x2
read y2
echo "Enter the coordinate of point C"
read x3
read y3
echo "Enter the coordinate of point D"
read x4
read y4
let p=`expr $x2-$x1`	#diff of x coordinate for AB
let q=`expr $y2-$y1`	#diff of y coordinate for AB
let r=`expr $x3-$x2`	#x coordinate for BC
let s=`expr $y3-$y2`	#y coordinate for BC
let t=`expr $x4-$x3`	#x coordinate for CD
let u=`expr $y4-$y3`	#y coordinate for CD
let v=`expr $x1-$x4`	#x coordinate for AD
let x=`expr $y1-$y4`	#y coordinate for AD
let a=`expr $x2-$x4`	#x coordinate for BD
let b=`expr $y2-$y4`	#y coordinate for BD
let c=`expr $x3-$x1`	#x for CA
let d=`expr $y3-$y1`	#y for CA
let X1=$(echo "$p * $p" |bc)	#squaring the difference
let Y1=$(echo "$q * $q" |bc)
let X2=$(echo "$r * $r" |bc)
let Y2=$(echo "$s * $s" |bc)
let X3=$(echo "$t * $t" |bc)
let Y3=$(echo "$u * $u" |bc)
let X4=$(echo "$v * $v" |bc)
let Y4=$(echo "$x * $x" |bc)
let BD1=$(echo "$a * $a" |bc)
let BD2=$(echo "$b * $b" |bc)
let CA1=$(echo "$c * $c" |bc)
let CA2=$(echo "$d * $d" |bc)
#calculating slope of each line segment
if [[ $p -eq 0 || $r -eq 0 || $t -eq 0 || $v -eq 0 ]]
then
	echo ""
else
	slope_AB=$(echo "scale = 0; $((q / p))" |bc -l)
	slope_BC=$(echo "scale = 0; $((s / r))" |bc -l)
	slope_CD=$(echo "scale = 0; $((u / t))" |bc -l)
	slope_AD=$(echo "scale = 0; $((x / v))" |bc -l)
fi
#calculating length of each side
let AB=$(echo "scale = 0;  sqrt ($X1 + $Y1)" |bc -l)
let BC=$(echo "scale = 0;  sqrt ($X2 + $Y2)" |bc -l)
let CD=$(echo "scale = 0;  sqrt ($X3 + $Y3)" |bc -l)
let AD=$(echo "scale = 0;  sqrt ($X4 + $Y4)" |bc -l)
#calculating length of diagonals
BD=$(echo "scale = 0;  sqrt ($BD1 + $BD2)" |bc -l)
CA=$(echo "scale = 0;  sqrt ($CA1 + $CA2)" |bc -l)
PYT1=$(echo "scale = 0; sqrt ($((AD * AD)) + $((CD * CD)))" |bc -l)	#THIS SHOULD BE EQUAL TO CA, To check the lines BC and CD are perpendicular
#calculate mid point of Diagonal CA
MIDX1=$(echo "scale = 0; $((x1 + x3)) / 2" |bc -l)
MIDY1=$(echo "scale = 0; $((y1 + y3)) / 2" |bc -l)
#calculate mid point of Diagonal BD
MIDX2=$(echo "scale = 0; $((x2 + x4)) / 2" |bc -l)
MIDY2=$(echo "scale = 0; $((y2 + y4)) / 2" |bc -l)
echo $AB $BC $CD $AD $BD $CA $PYT1
#condition checking
if [[ $PYT1 -eq $CA && $AB -eq $CD && $AD -eq $BC && $AB -ne $BC ]]	#Hypotenuse should be equal to CA then AB perpendicular to CD and opposite sides are equal
then
	echo "Is a rectantangle"
	exit 1
elif [[ $PYT1 -eq $CA && $AB -eq $BC && $BC -eq $CD && $AB -eq $AD ]]	#Hypotenuse should be equal to CA then AB perpendicular to BC i.e, <ABC = 90 and all sides should equal
then
	echo "Is a square"
	exit 1
elif [[ $slope_AB -eq $slope_CD && $slope_AD -eq $slope_BC && $AD -eq $BC && $AB -eq $CD && $MIDX1 -eq $MIDX2 && $MIDY1 -eq $MIDY2 ]]	#slope of opposite line should be equal, opposite side should be equal, mid point of both diagonal should be same.
then
	echo "Is a parallelogram"
	exit 1
else
	echo "Is a quadilateral"
	exit 1
fi
