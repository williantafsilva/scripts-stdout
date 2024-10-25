#!/bin/bash
############################################################################
############################ STDOUT FUNCTION ###############################
############################################################################
#Author: Willian T.A.F. Silva (willian.silva@evobiolab.com).
############################################################################
##SCRIPT DESCRIPTION:

##Description:
##List samples in a VCF/BCF file using bcftools.

##Input: VCF/BCF file.
##Output: List of samples.

##Usage: 
##vcfsamples-stdout.sh <VCF/BCF FILE>

############################################################################
##ACTIONS:

##Input file.
INPUTFILE=$(readlink -f $1)

##Process.
bcftools query -l ${INPUTFILE}

############################################################################
##END OF BASH SCRIPT...
############################################################################