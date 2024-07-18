#!/bin/bash
##############################################################################################
#      Linux File Checker Extension 
#   1. Run this script as extension to AppDynamics (monitor.xml, filechecker.sh)
#   2. Update filechecker.sh to include the files you need to check. 
#   3. Once these 2 files are stored in <machine-agent>/monitors/filechecker folder, restart Machine agent service
# The following metrics will be collected in addition to the default OS Linux metrics
#
#        Custom Metrics|FileChecker|$file|Available
# Created - 07/18/2024


# List of files to check
files=("file1.txt" "file2.pdf" "/path/to/file3.jpg")

for file in "${files[@]}"; do
    if [ -f "$file" ]; then
        echo "$file exists."
        echo "name=Custom Metrics|FileChecker|$file|Available,aggregator=OBSERVATION,value=1"
    else
        echo "$file does not exist."
        echo "name=Custom Metrics|FileChecker|$file|Available,aggregator=OBSERVATION,value=0"
    fi
done


