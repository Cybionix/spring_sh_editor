#!/bin/bash
service_interface_class() {
echo "SERVICE INTERFACE CLASS " $1 $2 $3

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
basesi="service_interface"
# foldersi=$W/$base${P//.//}/$basesi
foldersi=$base${P//.//}/$basesi
mkdir -p -- "$foldersi"

si="_Service_Interface"
sicls=$foldersi/$C$si$ext

lar="s"
byid="ById"

cat > "$sicls" << EOF1
package $P.service_interface;

import java.util.List;

import com.perceig.Retails.models.$C;

public interface $C$si {
	
Iterable<$C> listAll$C$lar();

$C get$C$byid(Long $lcn$id);
    
void delete$C(Long $lcn$id);

$C save$C($C $lcn);

}
EOF1
}
