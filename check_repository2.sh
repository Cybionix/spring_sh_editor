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


echo "R S: " $r $s \n \n \n

for((j=0; j < $k-1 ; j++)) {
# echo $j
#	if [ $j -gt 0 ] 
#	then
		x=${ary[$j]}
		y=${ary[$j+1]}
#	echo $x $y
		if [ "$x" = "$r" ]
		then
#			echo "One" $x $y
			if [ "$y" == "$s" ]
			then
				echo $x $y ${res[$j]} ${res[$j+1]}
				unset res[$j]
				unset res[$j+1]
				unset ary[$j]
				unset ary[$j+1]
			#	u=expr $j-2
			#	u=$(( j - 2 ))
				j=0
				k=${#res[@]}
			fi
		fi
		echo "Array Length : " ${#res[@]} $j
		z=2
		w=${#res[@]}
	#	if [ $w -eq $z ]
		if (( "$w" == "$z" ))
		then
			x=${ary[0]}
			y=${ary[1]}
			echo $x $y ${res[$j]} ${res[$j+1]}
		fi
#	fi
# echo "							" ${res[@]}

}

# echo ${ary[@]}
# echo ${res[@]}


