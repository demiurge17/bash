#!/bin/bash

get_cpu(){
echo "Free CPU: "
mpstat | awk '$NF ~ /[0-9.]+/ { print 100 -$NF"% used"}'
}

main(){
    get_cpu
}

main
