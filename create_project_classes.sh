#!/bin/bash
. create_project/main_class.sh
. create_project/maven_pom.sh
. create_project/simple_model_class.sh
. create_project/repository_class.sh
. create_project/service_interface_class.sh
. create_project/service_implements_class.sh
. create_project/controller_class.sh

create_project_classes() {
res=$( main_class )

inputs=(${res//;/ })

gid=${inputs[0]}
aid=${inputs[1]}
ver=${inputs[2]}
name=${inputs[3]}

# P=${gid}.${aid}
# CA=${inputs[2]}
# C=${inputs[2]}
# PN=${inputs[3]}

maven_pom ${gid} ${aid} ${ver} ${name}
create_project_structure ${gid} ${aid} ${ver} ${name}
application_class ${gid} ${aid} ${ver} ${name}
resource_settings ${gid} ${aid} ${ver} ${name}

# echo "INPUT PARAMETERS: " $res $P $CA $PN

if [ "$C" != "" ]
then

	simple_model_class $P $C $PN

	repository_class $P $C $PN

	service_interface_class $P $C $PN

	service_implements_class $P $C $PN

	controller_class $P $C $PN
fi

}

create_project_classes
