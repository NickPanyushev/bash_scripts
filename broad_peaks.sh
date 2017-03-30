#!/bin/bash

for i in A549_H3K27ac_merge.bam A549_H3K4me1_merge.bam A549_H3K4me3_merge.bam A549_H3K36me3_rep1.fastq.bam

do

TAG=${i%%.bam}
macs2 callpeak -t $i -c A549_Input_merge.bam -n $TAG --broad -g hs --broad-cutoff 0.1
done

