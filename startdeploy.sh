#!/bin/bash

while true
do
   sleep 1200m
   cd / &&  okteto stack deploy --wait
done
