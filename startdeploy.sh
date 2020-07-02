#!/bin/bash

function rand(){
    min=$1
    max=$(($2-$min+1))
    num=$(date +%s%N)
    echo $(($num%$max+$min))
}

while true
do
   rnd=$(rand 10 50)
   sed -e "s/00/$rnd/" okteto-stack1.yml > okteto-stack.yml
   sleep 180m
   cd / &&  okteto stack deploy --wait
done
