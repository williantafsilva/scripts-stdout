#!/bin/bash
############################################################################
############################ STDOUT FUNCTION ###############################
############################################################################
#Author: Willian T.A.F. Silva (willian.silva@evobiolab.com).
############################################################################
##SCRIPT DESCRIPTION:

##Description:
##Count number of reads in a FastQ file.

##Input: FastQ file (*.fastq.gz or *.fq.gz).
##Output: Number of reads.

##Usage: 
##fastqnreads-stdout.sh <FASTQ FILE>

############################################################################
##ACTIONS:

##Input file.
INPUTFILE=$(readlink -f $1)

##Process.
echo $(zcat ${INPUTFILE} | wc -l)/4 | bc

############################################################################
##END OF BASH SCRIPT...
############################################################################