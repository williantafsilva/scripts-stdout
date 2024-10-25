#!/bin/bash
############################################################################
############################ STDOUT FUNCTION ###############################
############################################################################
#Author: Willian T.A.F. Silva (willian.silva@evobiolab.com).
############################################################################
##SCRIPT DESCRIPTION:

##Description:
##View number of variants by contig/chromosome in a VCF file.

##Input: Indexed VCF/BCF file.
##Output: Number of variants by contig/chromosome.

##Usage: 
##vcfnvarperchr-stdout.sh <VCF/BCF FILE>

############################################################################
##ACTIONS:

##Input file.
INPUTFILE=$(readlink -f $1)

##Process.
bcftools query -f '%CHROM\t%POS\n' ${INPUTFILE} | awk '{n[$1]++} END {for(i in n) print i, n[i]}' | sort -nbr -k 2

############################################################################
##END OF BASH SCRIPT...
############################################################################