#!/bin/bash
############################################################################
############################ STDOUT FUNCTION ###############################
############################################################################
#Author: Willian T.A.F. Silva (willian.silva@evobiolab.com).
############################################################################
##SCRIPT DESCRIPTION:

##Description:
##View chromosomes/scaffolds in a VCF/BCF file using bcftools.

##Input: Indexed VCF/BCF file.
##Output: List of chromosomes/scaffolds.

##Usage: 
##vcfchrs-stdout.sh <VCF/BCF FILE>

############################################################################
##ACTIONS:

##Input file.
INPUTFILE=$(readlink -f $1)

##Process.
bcftools index -s ${INPUTFILE} | cut -f 1

############################################################################
##END OF BASH SCRIPT...
############################################################################