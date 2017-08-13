#!/bin/bash
repository_class() {

echo "REPOSITORY CLASS " $1 $2 $3

P=$1
C=$2
PN=$3
lcn=${C,} 

if [ ! -z "$4" ]; then
W=$4
else
W=$(pwd)
fi
FD="/src/main/java/"
ext=".java"
id="_id"


base=$PN$FD
baser="repository"
# folderr=$W/$base${P//.//}/$baser
folderr=$base${P//.//}/$baser
mkdir -p -- "$folderr"

repo="_Repository"
repocls=$folderr/$C$repo$ext

cat > "$repocls" << EOF1
package $P.repository;

import org.springframework.data.repository.CrudRepository;

import $P.models.$C;

public interface $C$repo extends CrudRepository<$C, Long> {

}

EOF1
}
