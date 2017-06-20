#!/bin/bash

INPUT_FILE=$1
echo "/repository/user/main/public/root = "$PWD"" > $HOME/.ncbi/user-settings.mkfg

while read line
do
 read SRR FILENAME <<< "$line"
 fastq-dump --split-3 --gzip $SRR
 rename.ul $SRR $FILENAME *
done < $INPUT_FILE # NOTE THIS INPUT REDIRECT

