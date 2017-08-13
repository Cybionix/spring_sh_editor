#!/bin/bash

. edit_project/main_class.sh
. edit_project/front_end_configure.sh

PD=$(select_project)

echo $PD

inputs=(${PD// / })
