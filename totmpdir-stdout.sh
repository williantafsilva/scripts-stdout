#!/bin/bash -l
############################################################################
############################ STDOUT FUNCTION ###############################
############################################################################
#Author: Willian T.A.F. Silva (willian.silva@evobiolab.com).
############################################################################
##SCRIPT DESCRIPTION:

##Description:
##Copy files to tmp directory.

##Input: Files.
##Output: Copies of files in tmp directory.

##Usage: 
##totmpdir-stdout.sh <FILES>

############################################################################
##ACTIONS:

##Input.
INPUTFILES="$@"

##Process.
find ${INPUTFILES} -maxdepth 0 | while read F ; do
	cp -r ${F} ${PATHTOPROJTMP}
	echo "Copy of file ${F} created in directory ${PATHTOPROJTMP}"
done

############################################################################
##END OF BASH SCRIPT...
############################################################################