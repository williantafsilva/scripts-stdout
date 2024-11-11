#!/bin/bash
############################################################################
############################ STDOUT FUNCTION ###############################
############################################################################
#Author: Willian T.A.F. Silva (willian.silva@evobiolab.com).
############################################################################
##SCRIPT DESCRIPTION:

##Description:
##View VCF/BCF file data (no header) using bcftools.

##Input: VCF/BCF file.
##Output: VCF/BCF file data (no header).

##Usage: 
##vcfdata-stdout.sh <VCF/BCF FILE>

############################################################################
##ACTIONS:

##Input file.
INPUTFILE=$(readlink -f $1)

##Process.
bcftools view -H ${INPUTFILE} | less -S

############################################################################
##END OF BASH SCRIPT...
############################################################################