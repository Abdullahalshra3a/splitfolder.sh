#!/bin/bash
FILENAME=/home/abdullah/Desktop/CICDDDoS2019/cat/DrDoS_DNS.csv
HDR=$(head -1 $FILENAME)
split -b 1G $FILENAME TFTP.csv --verbose
n=1
for f in TFTP*
do
     if [ $n -gt 1 ]; then 
          echo $HDR > Part${n}.csv
     fi
     cat $f >> Part${n}.csv
     rm $f
     ((n++))
done
echo "finishd"
