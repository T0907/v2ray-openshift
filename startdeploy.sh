#!/bin/bash

while true
do
   sleep 600m
   cd / &&  okteto stack deploy --wait
done
