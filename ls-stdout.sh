#!/bin/bash
############################################################################
############################ STDOUT FUNCTION ###############################
############################################################################
#Author: Willian T.A.F. Silva (willian.silva@evobiolab.com).
############################################################################
##SCRIPT DESCRIPTION:

##Description:
##Move or change name of input file.

##Input 1: Input directory.
##Input 2: Maximum depth.
##Output: List of files and counts.

##Usage: 
##ls-stdout.sh <INPUT DIRECTORY> 

############################################################################
##ACTIONS:

RUNDATE=$(date +"%Y%m%d%H%M%S")

##Input.
if [[ -z "$1" ]] ; then
	INPUTDIR=$(readlink -f .)
else
	INPUTDIR=$(readlink -f $1)
fi

##Process.
IFS=$'\t'
ls -hF --color=always ${INPUTDIR}
echo "----------------------------------------------------------------------------"
echo "Directories: $(find ${INPUTDIR}/* -maxdepth 0 -type d | wc -l)"
echo "Files:"
find ${INPUTDIR}/* -maxdepth 0 -type f -print | awk -F . '{print $NF}' | sort | uniq -c | sort -n
echo "TOTAL (files + directories): $(find ${INPUTDIR}/* -maxdepth 0 | wc -l)"
echo "----------------------------------------------------------------------------"
IFS='$ORIGINALIFS'

############################################################################
##END OF BASH SCRIPT...
############################################################################