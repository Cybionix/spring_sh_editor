#!/bin/bash
service_implements_class() {
echo "SERVICE IMPLEMENTS CLASS " $1 $2 $3

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

basesii="service_implements"
# foldersii=$W/$base${P//.//}/$basesii
foldersii=$base${P//.//}/$basesii
mkdir -p -- "$foldersii"

sii="_Service_Implements"
siicls=$foldersii/$C$sii$ext

lar="s"
byid="ById"

repoa="_Repository"

cat > "$siicls" << EOF1
package $P.service_implements;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import $P.models.$C;
import $P.repository.$C$repoa;
import $P.service_interface.$C$si;

@Service
public class $C$sii implements $C$si {

	private $C$repoa $lcn$repoa;
	
	@Autowired
	public void set$C$repoa($C$repoa $lcn$repoa) {
		this.$lcn$repoa = $lcn$repoa;
	}

	@Override
	public Iterable<$C> listAll$C$lar() {
		return this.$lcn$repoa.findAll();
	}

	@Override
	public $C get$C$byid(Long $lcn$id) {
		return this.$lcn$repoa.findOne($lcn$id);
	}

	@Override
	public void delete$C(Long $lcn$id) {
		this.$lcn$repoa.delete($lcn$id);
	}

	@Override
	public $C save$C($C $lcn) {
		return this.$lcn$repoa.save($lcn);
	}

}

EOF1

# 
# 
#  Service Implements Class End HERE
# 
# 
}
