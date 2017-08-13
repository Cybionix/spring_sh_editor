#!/bin/bash
check_repository() {
	grep -n $1 $2 | cut -d : -f 1
}

get_method() {
	hu=$(sed "$1q;d" $2)
	huw=(${hu// / })
	v=$3
	((v++))
	if [[ ${huw[$3]} == *"("* && ${huw[$3]} != *")"* ]]
	then
    		echo ${huw[$3]} ${huw[$v]}
	else
		echo ${huw[$3]}
	fi
	
}


fl=~/Shell_Script/Trails/Perceig/src/main/java/org/cybi/Perceig/service_implements/Welcome_Service_Implements.java

res=$( check_repository { $fl )
res1=$( check_repository } $fl )

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

declare -A matrix
num_rows=4
num_columns=$b
c=0

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
	if [ "$x" = "$r" ]
	then
		if [ "$y" == "$s" ]
		then
			echo $x $y ${res[$j]} ${res[$j+1]}
			matrix[$c,0]=${res[$j]}
			matrix[$c,1]=${res[$j+1]}
			matrix[$c,2]=$(get_method ${res[$j]} $fl 2)
			unset -v res[$j]
			unset -v res[$j+1]
			res=("${res[@]}")
			unset -v ary[$j]
			unset -v ary[$j+1]
			ary=("${ary[@]}")
			j=0
			k=${#res[@]}
			(( c++ ))
		else
			(( j++ ))
		fi
	else
		(( j++ ))	
	fi
done

#	IFS=

for((j=0; j < $num_columns ; j++)) {
	echo ${matrix[$j,0]} ${matrix[$j,1]} ${matrix[$j,2]}
#	echo $(get_method ${matrix[$j,0]} $fl 2)

#	echo $(sed -n -e ${matrix[$j,0]},${matrix[$j,1]}p ~/Shell_Script/Trails/Perceig/src/main/java/org/cybi/Perceig/service_implements/Welcome_Service_Implements.java )

#	echo $(awk "NR>=${matrix[$j,0]}&&NR<=${matrix[$j,1]}" ~/Shell_Script/Trails/Perceig/src/main/java/org/cybi/Perceig/service_implements/Welcome_Service_Implements.java)

}

#	echo ${matrix[@]}




