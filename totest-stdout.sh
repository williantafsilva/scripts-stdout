#!/bin/bash -l
############################################################################
############################ STDOUT FUNCTION ###############################
############################################################################
#Author: Willian T.A.F. Silva (willian.silva@evobiolab.com).
############################################################################
##SCRIPT DESCRIPTION:

##Description:
##Copy files to test directory.

##Input: Files.
##Output: Copies of files in test directory.

##Usage: 
##totest-stdout.sh <FILES>

############################################################################
##ACTIONS:

##Input.
INPUT="$@"

##Process.
IFS=$' '
find ${INPUT} -maxdepth 0 | while read F ; do
	cp -r ${F} ${PATHTOPROJTEST}
	echo "Copy of file ${F} created in directory ${PATHTOPROJTEST}"
done
IFS='$ORIGINALIFS'

############################################################################
##END OF BASH SCRIPT...
############################################################################