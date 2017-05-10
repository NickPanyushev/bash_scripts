#!/bin/bash

#This script downloads files from SRA by GSE accession
# Tab-delimited list of GSM-name correspondences (no spaces!)
# IF one GSM has more than one run, their names should be delimited by space

INPUT_FILE=$1

while read line
do
 read GSE FILENAME <<< "$line"
 #SRR=`esearch -db sra -query "$GSE" | efetch -format runinfo | grep SRR | awk -F "," '{print $1}'`
 #echo $SRR
 echo $GSE $FILENAME

done < $INPUT_FILE # NOTE THIS INPUT REDIRECT

