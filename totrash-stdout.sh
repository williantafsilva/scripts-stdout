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
##Output: Move input files to trash directory.

##Usage: 
##totrash-stdout.sh <INPUT FILE> <OUTPUT FILE NAME>

############################################################################
##ACTIONS:

RUNDATE=$(date +"%Y%m%d%H%M%S")

#Path to trash directory.
TRASHDIR=$(echo "${PATHTOPROJTRASH}/trash-${RUNDATE}")

##Input.
INPUT="$@"

##Process.
mkdir -p ${TRASHDIR} #Create trash directory.

IFS=$' '
find ${INPUT} -maxdepth 0 | while read F ; do

	FILEX=$(readlink -f ${F})
	echo "Moving to trash: ${FILEX}"
	FILEXLOCATION=${FILEX%/*}
	mv ${FILEX} ${TRASHDIR}
	
	echo "############################################################################
Date: ${RUNDATE}
totrash-stdout.sh ${FILEX}
" >> $(echo "${FILEXLOCATION}/README.txt")
	
	echo "############################################################################
Date: ${RUNDATE}
totrash-stdout.sh ${FILEX}
" >> $(echo "${PATHTOPROJTRASH}/README.txt")

done
IFS='$ORIGINALIFS'

############################################################################
##END OF BASH SCRIPT...
############################################################################