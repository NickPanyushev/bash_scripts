#!/usr/bin/python3

import sys

#from Bio import Entrez, SeqIO

#Entrez.email = 'panyushev@nextmail.ru'

with open(sys.argv[1], 'r') as file:
    dict={}
    for line in file:
        GSM, filenames = line.split("\t")
        filenames = filenames.rstrip()
        dict[GSM] = filenames.split(",")
    print (dict)

for keys in dict:
    
