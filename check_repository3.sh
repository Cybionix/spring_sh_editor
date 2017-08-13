#!/bin/bash

check_repository() {
	grep -n $1 $2 | cut -d : -f 1
}

res=$( check_repository { ~/Shell_Script/Trails/Perceig/src/main/java/org/cybi/Perceig/service_implements/Welcome_Service_Implements.java )
res1=$( check_repository } ~/Shell_Script/Trails/Perceig/src/main/java/org/cybi/Perceig/service_implements/Welcome_Service_Implements.java )

echo "INPUT PARAMETERS: " $res "\n" $res1

input1=(${res// / })
input2=(${res1// / })

a=0
b=${#input1[@]}
c=${#input2[@]}
ary=()
res=()
m=0
n=0

echo $b $q

for((; n < b ; )) {
	if [ $m -lt $b ]
	then 
		if [ ${input1[$m]} -le ${input2[$n]} ]
			then 
				echo "Array 1: " ${input1[$m]}
				res+=(${input1[$m]})
				((m++))
				ary+=("a")
			else
				echo "Array 2: " ${input2[$n]}
				res+=(${input2[$n]})
				((n++))
				ary+=("b")
		fi
	else
		echo "Array 2: " ${input2[$n]}
		res+=(${input2[$n]})
		((n++))
		ary+=("b")
	fi
}

k=${#res[@]}
r="a"
s="b"

j=0

while [ $j -lt $k ]
do

		x=${ary[$j]}
		y=${ary[$j+1]}

# echo  "J		:" $j $k $x $y

		if [ "$x" = "$r" ]
		then
			if [ "$y" == "$s" ]
			then
				echo $x $y ${res[$j]} ${res[$j+1]}
			#	echo "						"  ${ary[@]}
				unset -v res[$j]
				unset -v res[$j+1]
			res=("${res[@]}")
				unset -v ary[$j]
				unset -v ary[$j+1]
			ary=("${ary[@]}")
			#	u=$(( j - 2 ))
				j=0
				k=${#res[@]}
			else
				(( j++ ))
			fi
		else
			(( j++ ))	
		fi
done





