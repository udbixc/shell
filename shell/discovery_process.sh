#!/bin/bash

/usr/bin/top -b -n 1 -w512 > /tmp/.top.txt

proc_array=(`tail -n +8 /tmp/.top.txt | awk '{a[$NF"-"$1]+=$10}END{for(k in a)print a[k],k}'|sort -gr|head -10|cut -d" " -f2`)
length=${#proc_array[@]}
printf "{\n"
printf '\t'"\"data\":["
for ((i=0;i<$length;i++))
do
    printf '\n\t\t{'
        printf "\"{#PROCESS_NAME}\":\"${proc_array[$i]}\"}"
	if [ $i -lt $[$length-1] ];then
	    printf ','
		fi
		done
		printf "\n\t]\n"
		printf "}\n"
