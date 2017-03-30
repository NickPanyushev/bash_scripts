#!/bin/bash

# Please note! This script is intended for peak calling for narrow peaks in homo sapiens
# else you should change the -g hs to mm, ce, dm, etc. See the MACS readme (https://github.com/taoliu/MACS) for more info


TREATMENT=$1 #Treatment .bam file
BG=$2	#Background .bam file
NAME=$3	#the name of the output files
OUT_DIR=$4 #If you want MACS2 to store files in desired directory, pass the path

if [[ ! $NAME  ]] && [[ ! $BG ]]; # Assign a name if it is not passed
then 
	NAME=${TREATMENT%%.bam}_nobg

elif [[ ! $NAME  ]] && [[ $BG ]];
then
	NAME=${TREATMENT%%.bam}_vs_${BG%%.bam}
fi

if [[ $OUT_DIR ]];
then
	macs2 callpeak -t $TREATMENT -c $BG --outdir $OUT_DIR -f BAM -g hs -n $NAME -B -q 0.01
else
	macs2 callpeak -t $TREATMENT -c $BG -f BAM -g hs -n $NAME -B -q 0.01

fi
