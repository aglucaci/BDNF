#! /bin/bash
# Alexander G. Lucaci
# 02042020

# Run FMM on aligned codon msa and newick tree.
# More information here: https://github.com/veg/hyphy-analyses/tree/master/FitMultiModel

# Declares

INPUTFASTA="HyPhy/BDNF_codons.fasta_CODON_AWARE_ALN.fasta"
INPUTNWK="MEGA/BDNF_codons.fasta_CODON_AWARE_ALN.fasta_NJ_Tree.nwk"

FMM="/Users/user/hyphy-analyses/FitMultiModel/FitMultiModel.bf"

# Main 

echo "Running FMM"

# 1
hyphy $FMM --code Universal --alignment $INPUTFASTA --tree $INPUTNWK --triple-islands Yes

# 2 Second try, change the rates to 10
hyphy $FMM --code Universal --alignment $INPUTFASTA --tree $INPUTNWK --rates 10 --output #INPUTFASTA"_Rates10.FITTER.json" --triple-islands Yes

# End of file