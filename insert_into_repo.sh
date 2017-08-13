#!/bin/bash
insert_into_repo() {

echo "EDIT REPO CLASS " $1 $2 $3

P=$1
C=$2
PN=$3
lcn=${C,} 

W=$(pwd)
FD="/src/main/java/"
ext=".java"
id="_id"


base=$PN$FD
ctrl="controller"
foldercn=$W/$base${P//.//}/$ctrl
mkdir -p -- "$foldercn"

cni="_Controller"
cncls=$foldercn/$C$cni$ext
show="show"
form="form"
ser="_Service"



	
ed=$'\\\t@Query(\"FROM User t where email = ?1\") \
\tpublic List<User> findUserByEmail(String email);
\t}'

}





