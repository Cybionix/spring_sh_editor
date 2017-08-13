#!/bin/bash
. include/main_class.sh
. include/simple_model_class.sh
. include/repository_class.sh
. include/service_interface_class.sh
. include/service_implements_class.sh
. include/controller_class.sh

res=$( main_class )

inputs=(${res//;/ })
P=${inputs[0]}
C=${inputs[1]}
PN=${inputs[2]}

echo "INPUT PARAMETERS: " $res $P $C $PN

simple_model_class $P $C $PN

repository_class $P $C $PN

service_interface_class $P $C $PN

service_implements_class $P $C $PN

controller_class $P $C $PN
