#!/usr/bin/env python3
# -*- coding: utf-8 -*-
"""
Created on Sat Jan 25 16:59:50 2020

@author: alexander g. lucaci

Filter ntBlast results for partial sequences and other things.
"""

# Imports
# =============================================================================
import os
from Bio import SeqIO
from Bio.Seq import Seq
from Bio.SeqRecord import SeqRecord
from Bio.Alphabet import IUPAC

# Declares
# =============================================================================
nt_blast = "ntblast_sequences.txt"
output_fasta = "seqdump_ammended.txt"

query_length = 3827 # bp

# Main subroutine.
# =============================================================================
count = 0
species_represented = []
species_represented_dict = {}

for n, record in enumerate(SeqIO.parse(nt_blast, "fasta")):
    sequence = record.seq
    ID = record.id
    desc = record.description
    #if "PREDICTED" not in desc and "partial" not in desc and "Homo sapiens" not in desc and "Human" not in desc:
    #if "PREDICTED" not in desc.upper() and "partial" not in desc.lower() and "fragment" not in desc.lower() and "synthetic" not in desc.lower() and len(sequence) < query_length * 5 and len(sequence) > query_length * 0.5:
    if "PREDICTED" not in desc.upper() and "partial" not in desc.lower() and "fragment" not in desc.lower() and "synthetic" not in desc.lower():
        count += 1
        #print(count, len(sequence), desc)
        
        species_name = desc.split(" ")[1:3]
        #print(species_name)
        
        print(">"+ID + desc, len(sequence))
        print(sequence)
        
        """
        try:
            if species_represented_dict[" ".join(species_name)] == 0:
                species_represented.append(" ".join(species_name))
        except:
            species_represented_dict[" ".join(species_name)] = 0
            
        """
        
#print("Species represented:", len(set(species_represented)))
        

#for item in set(species_represented):
#    print(item)



# End of file
# =============================================================================

