#!/bin/bash

get_cpu(){
echo "Free CPU: "
mpstat | awk '$NF ~ /[0-9.]+/ { print 100 -$NF"% used"}'
}

get_memory(){
echo "Free Memory: "

free -m | awk '$NF ~ /[0-9.]+/ { print $4/$2 * 100 }' 


}

get_disk(){
echo "Disk Usage: "

df -h --total | grep ^total

}

get_cpu_usage(){
echo "These are eating your processor: "

ps -Ao user,comm,pid,pcpu --sort=-pcpu | head -n 6

}

main(){

    get_cpu
    get_memory
    get_disk
    get_cpu_usage
}

main
