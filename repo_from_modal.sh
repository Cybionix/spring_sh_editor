#!/bin/bash
. front_end_configure.sh
repo_from_modal() {




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
