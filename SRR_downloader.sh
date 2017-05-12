#!/bin/bash

INPUT_FILE=$1

while read line
do
 read SRR FILENAME <<< "$line"
 fastq-dump --split-3 --gzip $SRR
 wait
 mv $SRR $filename 
done < $INPUT_FILE # NOTE THIS INPUT REDIRECT

