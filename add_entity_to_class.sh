#!/bin/bash



add entity_to_class() {
enty=$(sed -n '/private/{=;p}' $1  | sed '{N;s/\n/ /}')

}
