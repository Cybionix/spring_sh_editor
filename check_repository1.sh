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

ARRAY=()

m=0
n=0

echo $b $q

while [ $m -le $b ]
do
p=${input1[$m]}
q=${input2[$n]}

echo "P Q : " $p $q

	if [ $p -le $q ]
	then 
		echo $m
		echo "M P Q 1 : " $m $p $q
		((m++))
		ARRAY+=(1)
		if [ $m -eq $b ]
		then 
			((m--))
		fi
	else
		echo          $n
		echo "M P Q 2 : " $m $p $q
		((n++))
		ARRAY+=(2)
		if [ $n -eq $c ]
		then 
			((n++))
		else
			((m++))
		fi
		
	fi

done

echo $ARRAY


