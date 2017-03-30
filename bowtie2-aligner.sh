#!/bin/bash

## Please note! This script is intended for use on 770 and 769 workstations only! 
## The default setting for bowtie2 alignment is 4 threads(-p 4) and 3G of memory(-m 3G) per core (-@ 4) for samtools.
## Be careful!

$1=INDEX

for i in *.fastq.gz
do
echo "processing $i file"
TAG=${i%%.fastq.gz}
bowtie2 --sensitive-local -t -p 4 -S $TAG.sam -x $INDEX -U $i 
samtools sort $TAG.sam -@ 4 -m 3G -o $TAG.bam -O bam && rm $TAG.sam
echo
done

