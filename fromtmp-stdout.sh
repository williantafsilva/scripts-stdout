#!/bin/bash -l
############################################################################
############################ STDOUT FUNCTION ###############################
############################################################################
#Author: Willian T.A.F. Silva (willian.silva@evobiolab.com).
############################################################################
##SCRIPT DESCRIPTION:

##Description:
##Move target files/directories to the project tmp directory (${PATHTOPROJTMP}).

##Input $1: Output location
##Input $2: TMP subdirectory name (or tmp tag).
##Output: Move target files/directories from project tmp directory to output directory.
##Use fromtmp-stdout.sh <TAG> to move target files/directories the specified directory.

##Usage: 
##fromtmp-stdout.sh <OUTPUT LOCATION> <TMP TAG>

############################################################################
##ACTIONS:

RUNDATE=$(date +"%Y%m%d%H%M%S")

##Input.
OUTPUTLOCATION=$(readlink -f $1)
TMPDIRNAME=$2

##Process.

TMPSUBDIR=$(echo "${PATHTOPROJTMP}/${TMPDIRNAME}")

#Move input files/directories.
echo "----------------------------------------------
The following files/directories will be moved from ${PATHTOPROJTMP} to ${OUTPUTLOCATION}:
$(find ${TMPSUBDIR}/* -maxdepth 0)
"
mv ${TMPSUBDIR}/* ${OUTPUTLOCATION} 

############################################################################
##END OF BASH SCRIPT...
############################################################################