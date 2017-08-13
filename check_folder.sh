ans=$(ls -d */)
inputs=(${ans//;/ })
echo ${inputs[@]}
b=${#inputs[@]}

# declare matrix

for((c=0,i=0; i < $b ; i++ )) {
	echo $i ${inputs[$i]}
	re=$([ -f ${inputs[$i]}/pom.xml ] && echo "Found" || echo "Not found")
	if [ "$re" = "Found" ]
	then
matrix[$c]=${inputs[$i]::(-1)}
((c++))
	fi
}

echo "Maven projects: " ${#matrix[@]} ${matrix[@]} 

if (( ${#matrix[@]} > 1 ))
then
zenity --entry --title "Window title" --text "Insert your choice." "${matrix[@]}"
else
zenity --entry --title "Window title" --text "Insert your choice." "${matrix[0]}"
fi

