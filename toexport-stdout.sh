#!/bin/bash -l
############################################################################
############################ STDOUT FUNCTION ###############################
############################################################################
#Author: Willian T.A.F. Silva (willian.silva@evobiolab.com).
############################################################################
##SCRIPT DESCRIPTION:

##Description:
##Copy files to export directory.

##Input: Files.
##Output: Copies of files in export directory.

##Usage: 
##toexport-stdout.sh <FILES>

############################################################################
##ACTIONS:

##Input.
INPUT="$@"

##Process.
IFS=$' '
find ${INPUT} -maxdepth 0 | while read F ; do
	cp -r ${F} ${PATHTOPROJEXPORT}
	echo "Copy of file ${F} created in directory ${PATHTOPROJEXPORT}"
done
IFS='$ORIGINALIFS'

############################################################################
##END OF BASH SCRIPT...
############################################################################