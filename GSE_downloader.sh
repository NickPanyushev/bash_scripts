#!/bin/bash

#This script downloads files from SRA by GSE accession
# Tab-delimited list of GSM-name correspondences (no spaces!)
# IF one GSM has more than one run, their names should be delimited by space

INPUT_FILE=$1

#ВНУТРИ WHILE надо убрать все |!!!!

while read line
do
 read GSE FILENAME <<< "$line"
 PIPE="esearch -db sra -query "\"$GSE\""| efetch -format docsum | xtract -pattern DocumentSummary -element Run@acc"
 SRR={ eval $PIPE}
 echo $PIPE
 echo $SRR
 echo 
done < $INPUT_FILE # NOTE THIS INPUT REDIRECT



