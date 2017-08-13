#!/bin/bash

front_end_structure() {

aid=$1		# artifactId
cnm=$2

W=$(pwd)
FD="/src/main/resources/templates"
fn="$W/$aid$FD/$cnm"
echo $fn
mkdir -p -- "$fn/content"
mkdir -p -- "$fn/css"
mkdir -p -- "$fn/pages"
mkdir -p -- "$fn/scripts"
mkdir -p -- "$fn/structure"
}

get_package() {
gid=$(sed -n '/<groupId>/p' $1/pom.xml  | head -1| sed 's/ //g'| sed 's/<groupId>//g'| sed 's/<\/groupId>//g')
aid=$(sed -n '/<artifactId>/p' $1/pom.xml  | head -1| sed 's/ //g'| sed 's/<artifactId>//g'| sed 's/<\/artifactId>//g')
pnm=$(sed -n '/<name>/p' $1/pom.xml  | head -1| sed 's/ //g'| sed 's/<name>//g'| sed 's/<\/name>//g')
echo $gid $aid $pnm
}

get_project() {
# echo $1
ans=()
inputs=()
matrix=()
ans=$(ls -d $1/*/)
inputs=(${ans//;/ })
# echo ${inputs[@]}
b=${#inputs[@]}
for((c=0,i=0; i < $b ; i++ )) {
re=$([ -f ${inputs[$i]}/pom.xml ] && echo "Found" || echo "Not found"); 
if [ "$re" = "Found" ];
then 
matrix[$c]=${inputs[$i]::(-1)}; ((c++));
fi; 
}
# echo "Maven projects: " ${#matrix[@]} ${matrix[@]} 
if (( ${#matrix[@]} > 1 ))
then 
zenity --entry --title "Window title" --text "Insert your choice." "${matrix[@]}"
else 
echo ${matrix[0]}
fi
}

new_class() {
ans=$(zenity --forms --title="Create New Class" \
	--separator=";" \
	--add-entry="Class Name" );
echo "$ans"
}

select_project() {
fld=$(zenity --file-selection --directory)
# echo $fld
pj=$(get_project $fld)
pk=$(get_package $pj)
echo $pj ${pk[@]}
}

select_model_class() {
pl=$1
gid=$2
aid=$3
pn=$4

mcl_cl=${pl}/src/main/java/${gid//.//}/$aid/models
sl=$(ls ${mcl_cl})
# echo ${mcl_cl}
# echo ${sl}
cls=(${sl// / })
cl_nm=$(zenity --entry --title "Window title" --text "Insert your choice." "${cls[@]}")
echo ${cl_nm}
}

get_model_dir() {
pl=$1
gid=$2
aid=$3
pn=$4
echo ${pl}/src/main/java/${gid//.//}/$aid/models
}

select_class() {
cl=$(select_project)
sl_cl=$(select_model_class ${cl[@]})
echo ${sl_cl}
dr=$(get_model_dir ${cl[@]})
obj=$(get_objects ${dr}/${sl_cl})
echo ${obj}
}

get_objects() {
fl=$1
res=$(sed -n '/@Column/{=}' $fl)
inputs=(${res// / })
b=${#inputs[@]}
for((c=0,i=0; i < $b ; i++ )) {
ln=${inputs[$i]}
lne="$(( ln + 1 ))"
lno=$(sed -n -e ${lne}p $fl)
echo ${ln} $lno
}
echo ${res[@]}
} 







