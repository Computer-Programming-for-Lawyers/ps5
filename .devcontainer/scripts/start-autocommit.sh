#!/bin/bash
# Run autocommit.sh in a loop
while true; do
    .devcontainer/scripts/autocommit.sh 
    sleep 60 # runs every 1 min
done &