#!/bin/bash -l
############################################################################
############################ STDOUT FUNCTION ###############################
############################################################################
#Author: Willian T.A.F. Silva (willian.silva@evobiolab.com).
############################################################################
##SCRIPT DESCRIPTION:

##Description:
##Move or change name of input file.

##Input 1: Input files.
##Output: Delete input file.

##Usage: 
##rm-stdout.sh <INPUT FILE> <OUTPUT FILE NAME>

############################################################################
##ACTIONS:

RUNDATE=$(date +"%Y%m%d%H%M%S")

#Path to trash directory.
TRASHDIR=$(echo "${PATHTOPROJTRASH}/trash-${RUNDATE}")

##Input.
INPUTFILES="$@"

##Process.
mkdir -p ${TRASHDIR} #Create trash directory.

IFS=$' '
find ${INPUTFILES} -maxdepth 0 | while read F ; do

	FILEX=$(readlink -f ${F})
	echo "Moving to trash: ${FILEX}"
	FILEXLOCATION=${FILEX%/*}
	mv ${FILEX} ${TRASHDIR}
	
	echo "############################################################################
Date: ${RUNDATE}
rm-stdout.sh ${FILEX}
" >> $(echo "${FILEXLOCATION}/README.txt")
	
	echo "############################################################################
Date: ${RUNDATE}
rm-stdout.sh ${FILEX}
" >> $(echo "${TRASHDIR}/README.txt")

done
IFS='$ORIGINALIFS'

############################################################################
##END OF BASH SCRIPT...
############################################################################