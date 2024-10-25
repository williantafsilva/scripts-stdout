#!/bin/bash
############################################################################
############################ STDOUT FUNCTION ###############################
############################################################################
#Author: Willian T.A.F. Silva (willian.silva@evobiolab.com).
############################################################################
##SCRIPT DESCRIPTION:

##Description:
##View sample genotypes at a specific position in an indexed VCF file.

##Input $1: Indexed VCF/BCF file.
##Input $2: Chromosome.
##Input $3: Chromosome location.
##Output: Sample genotypes.

##Usage: 
##vcfgenotype-stdout.sh <VCF/BCF FILE> <CHR> <CHR LOCATION>

############################################################################
##ACTIONS:

##Input file.
INPUTFILE=$(readlink -f $1)
CHR=$2 ##Chromosome.
POSITION=$3 ##Chromosome location.

##Process.
bcftools query -H -f '%CHROM\t%POS\t%REF\t%ALT\t[ %GT]\n' ${INPUTFILE} | grep -E "\#|${CHR}$(printf '\t')${POSITION}" | less -S

############################################################################
##END OF BASH SCRIPT...
############################################################################