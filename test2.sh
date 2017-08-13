#!/bin/bash

# res=$(sed -n '/@Column(unique=true)/{=;p}' User.java| sed '{N;s/\n/ /}')

get_objects() {
fl=$1
res=$(sed -n '/@Column(unique=true)/{=}' $fl)


# matrix=()
inputs=(${res// / })
b=${#inputs[@]}
for((c=0,i=0; i < $b ; i++ )) {
ln=${inputs[$i]}

lne="$(( ln + 1 ))"
lno=$(sed -n -e ${lne}p $fl)

echo ${ln} $lno;
}

# echo ${res[@]}
}


