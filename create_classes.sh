#!/bin/bash

. edit_project/front_end_configure.sh
. create_project/simple_model_class.sh
. create_project/repository_class.sh
. create_project/service_interface_class.sh
. create_project/service_implements_class.sh
. create_project/controller_class.sh

PD=$(select_project)

echo $PD

inputs=(${PD// / })

# P=${gid}.${aid}
# CA=${inputs[2]}
# C=${inputs[2]}
# PN=${inputs[3]}

P=${inputs[1]}.${inputs[2]}
PN=${inputs[0]}
C=$(new_class)


if [ "$C" != "" ]
then

	simple_model_class $P $C $PN

	repository_class $P $C $PN

	service_interface_class $P $C $PN

	service_implements_class $P $C $PN

	controller_class $P $C $PN
fi
