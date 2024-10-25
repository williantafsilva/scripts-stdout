#!/bin/bash
############################################################################
############################ STDOUT FUNCTION ###############################
############################################################################
#Author: Willian T.A.F. Silva (willian.silva@evobiolab.com).
############################################################################
##SCRIPT DESCRIPTION:

##Description:
##Copy input file to a target directory.

##Input 1: Input files.
##Input 2: Output file name or target directory.
##Output: Copy of input files in target directory.

##Usage: 
##cp-stdout.sh <INPUT FILE> <OUTPUT FILE NAME>

############################################################################
##ACTIONS:

RUNDATE=$(date +"%Y%m%d%H%M%S")
ARGS="$@"

##Input.
INPUTFILE="${@:1:$#-1}" ##All but last argument.
OUTPUTFILE="${@:$#}" ##Last argument.

##Process.
IFS=$' '
for F in ${INPUTFILE} ; do
	FILEX=$(readlink -f ${F})
	cp -r ${FILEX} ${OUTPUTFILE}
	OUTPUTFILE=$(readlink -f ${OUTPUTFILE})
	OUTPUTFILELOCATION=${OUTPUTFILE%/*}
	echo "Copying file: ${FILEX} -----> ${OUTPUTFILE}"
	echo "############################################################################
Date: ${RUNDATE}
cp-stdout.sh ${ARGS}
" >> $(echo "${OUTPUTFILELOCATION}/README.txt")
done
IFS='$ORIGINALIFS'

############################################################################
##END OF BASH SCRIPT...
############################################################################