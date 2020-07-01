#!/bin/bash

function rand(){
    min=$1
    max=$(($2-$min+1))
    num=$(date +%s%N)
    echo $(($num%$max+$min))
}

while true
do
   rnd=$(rand 1 50)
   sed -i -e 's/400m/4'$rand'm/' okteto-stack.yml 
   sleep 600m
   cd / &&  okteto stack deploy --wait
done
