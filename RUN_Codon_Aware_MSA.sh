#! /bin/bash
# Alexander G. Lucaci
# 02042020

# Run codon aware msa on a coding sequence fasta
# More info here: https://github.com/veg/hyphy-analyses/tree/master/codon-msa

# Assumes you have conda installed hyphy
# Assumes you have mafft also installed command line (brew?)

# Declares

INPUTFASTA="BDNF_codons.fasta"
OUTPUTFASTA="BDNF_codon_aware_alignment.fasta"

PREMSA="/Users/user/hyphy-analyses/codon-msa/pre-msa.bf"
POSTMSA="/Users/user/hyphy-analyses/codon-msa/post-msa.bf"

# Main 

# 1
hyphy $PREMSA --input $INPUTFASTA

# 2
mafft --auto $INPUTFASTA"_protein.fas" > $INPUTFASTA"_protein.msa"

# 3
hyphy $POSTMSA --protein-msa $INPUTFASTA"_protein.msa" --nucleotide-sequences $INPUTFASTA"_nuc.fas" --output $INPUTFASTA"_CODON_AWARE_ALN.fasta" --compress No


# End of file