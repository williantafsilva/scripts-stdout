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
##totestdir-stdout.sh <FILES>

############################################################################
##ACTIONS:

##Input.
INPUTFILES="$@"

##Process.
find ${INPUTFILES} -maxdepth 0 | while read F ; do
	cp -r ${F} ${PATHTOPROJTESTDIR}
	echo "Copy of file ${F} created in directory ${PATHTOPROJTESTDIR}"
done

############################################################################
##END OF BASH SCRIPT...
############################################################################