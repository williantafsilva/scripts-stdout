#!/bin/bash -l
############################################################################
############################ STDOUT FUNCTION ###############################
############################################################################
#Author: Willian T.A.F. Silva (willian.silva@evobiolab.com).
############################################################################
##SCRIPT DESCRIPTION:

##Description:
##List screenshots available within the input directory or 
##(when no input directory is provided) all available screenshots.

##Input: Directory (optional).
##Output: List of screenshot tags and their corresponding original directories. 
##Use screenshot-recover-stdout.sh <SCREENSHOT TAG> to restore the target directory.

##Usage: 
##screenshot-list-stdout.sh <DIRECTORY>

############################################################################
##ACTIONS:

RUNDATE=$(date +"%Y%m%d%H%M%S")

##Input.
if [[ -z "$1" ]] ; then
	TARGETDIR=${PATHTOPROJSCREENSHOTS}
else
	TARGETDIR=$(readlink -f $1)
fi

##Process.
TARGETSCREENSHOTRECORDSFILE=$(echo "${TARGETDIR}/.screenshotrecords.txt")
if [[ ! -f ${TARGETSCREENSHOTRECORDSFILE} ]] ; then
    echo "----------------------------------------------
No screenshots available in this directory.
----------------------------------------------"
else
	echo "----------------------------------------------
The following screenshots are available:"
	cat ${TARGETSCREENSHOTRECORDSFILE}
	echo "----------------------------------------------"
fi

echo "To recover a screenshot, use:
\$ screenshot-recover-stdout.sh <TAG>"

############################################################################
##END OF BASH SCRIPT...
############################################################################