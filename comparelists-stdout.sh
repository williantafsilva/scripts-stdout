#!/bin/bash
############################################################################
############################ STDOUT FUNCTION ###############################
############################################################################
#Author: Willian T.A.F. Silva (willian.silva@evobiolab.com).
############################################################################
##SCRIPT DESCRIPTION:

##Description:
##Show similarities and differences between two lists.

##Input 1: File containing a list.
##Input 2: File containing a list.
##Output: Lines that are unique to file 1 (1st column), unique to file 2 (2nd column) and common to both files (3rd column).

##Usage: 
##comparelists-stdout.sh <FILE 1> <FILE 2>

############################################################################
##ACTIONS:

##Input file.
INPUTFILE1=$(echo $(readlink -f $1))
INPUTFILE2=$(echo $(readlink -f $2))

##Process.
echo "FILE1ONLY	FILE2ONLY	BOTH"
echo "----------	----------	----------"
comm <(sort ${INPUTFILE1}) <(sort ${INPUTFILE2})
NFILE1ONLY=$(comm -23 <(sort ${INPUTFILE1}) <(sort ${INPUTFILE2}) | wc -l)
NFILE2ONLY=$(comm -13 <(sort ${INPUTFILE1}) <(sort ${INPUTFILE2}) | wc -l)
NBOTH=$(comm -12 <(sort ${INPUTFILE1}) <(sort ${INPUTFILE2}) | wc -l)
echo "----------	----------	----------"
echo "${NFILE1ONLY}	${NFILE2ONLY}	${NBOTH}"

############################################################################
##END OF BASH SCRIPT...
############################################################################