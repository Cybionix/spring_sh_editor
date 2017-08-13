#!/bin/bash
simple_model_class() {

# 
# 
#  Model Class Start HERE
# 
# 

echo "MODEL CLASS " $1 $2 $3

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
basep="models"
# folder=$W/$base${P//.//}/$basep
folder=$base${P//.//}/$basep
mkdir -p -- "$folder"

classmain=$folder/$C$ext

cat > "$classmain" << EOF1
package $P.models;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Table;

@Entity
@Table(name="$lcn")
public class $C {

@Id
@GeneratedValue(strategy=GenerationType.AUTO)
private Long $lcn$id;

public $C() {
	}

}

EOF1


# 
# 
#  Model Class End HERE
# 
# 
}
