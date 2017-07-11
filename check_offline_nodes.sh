#!/bin/bash

function report_offline_nodes {
offline_nodes=( $(cat test.txt | grep -B 1 'offline' | grep node) )
down_nodes=( $(cat test.txt | grep -B 1 'Down' | grep node) )
for (( i=0; i<${#offline_nodes[@]}; i++ )); do logger "${offline_nodes[i]} is offline" ; done
for (( i=0; i<${#down_nodes[@]}; i++ )); do logger "${down_nodes[i]} is down" ; done
}

report_offline_nodes
