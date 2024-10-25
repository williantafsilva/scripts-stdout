#!/bin/bash -l
############################################################################
############################ STDOUT FUNCTION ###############################
############################################################################
#Author: Willian T.A.F. Silva (willian.silva@evobiolab.com).
############################################################################
##SCRIPT DESCRIPTION:

##Description:
##Screenshot back a directory.

##Input: Screenshot tag.
##Output: Recovered target directory.

##Usage: 
##screenshot-recover-stdout.sh <SCREENSHOT TAG>

############################################################################
##ACTIONS:

RUNDATE=$(date +"%Y%m%d%H%M%S")
FILESCREENSHOTRECORDS=$(echo "${PATHTOPROJSCREENSHOTS}/.screenshotrecords.txt")

##Input.
INPUTTAG=$1 

##Process.
#Check if tag exists.
SCREENSHOTRECORD=$(cat ${FILESCREENSHOTRECORDS} | grep ${INPUTTAG})
if [[ -z ${SCREENSHOTRECORD} ]] ; then
	echo "----------------------------------------------
The tag ${INPUTTAG} does not exist.
----------------------------------------------"
else
	DIRTARGET=$(cat ${FILESCREENSHOTRECORDS} | grep ${INPUTTAG} | cut -f2)
	DIRTARGETLOCATION=${DIRTARGET%/*}
	FILETARGETLOCATIONRECORDS=$(echo "${DIRTARGETLOCATION}/.screenshotrecords.txt")
	echo "----------------------------------------------
Restoring directory: ${DIRTARGET}"
	DIRSCREENSHOTCOPY=$(find ${PATHTOPROJSCREENSHOTS}/${INPUTTAG}/* -maxdepth 0)
	if [[ -d ${DIRTARGETLOCATION} ]] ; then
		if [[ -d ${DIRTARGET} ]] ; then
			rm -r ${DIRTARGET}
			cp -r ${DIRSCREENSHOTCOPY} ${DIRTARGETLOCATION}
		else
			cp -r ${DIRSCREENSHOTCOPY} ${DIRTARGETLOCATION}
		fi
	else
		mkdir -p ${DIRTARGETLOCATION}
		cp -r ${DIRSCREENSHOTCOPY} ${DIRTARGETLOCATION}
	fi
	cat ${FILESCREENSHOTRECORDS} | sed "/${INPUTTAG}/d" > ${FILESCREENSHOTRECORDS}
	echo -e "${INPUTTAG}\t${DIRTARGET}\tYES\t${RUNDATE}" >> ${FILESCREENSHOTRECORDS}
	cat ${FILETARGETLOCATIONRECORDS} | sed "/${INPUTTAG}/d" > ${FILETARGETLOCATIONRECORDS}
	echo -e "${INPUTTAG}\t${DIRTARGET}\tYES\t${RUNDATE}" >> ${FILETARGETLOCATIONRECORDS}
	echo "----------------------------------------------
The following directory has been recovered (screenshot tag ${INPUTTAG}):
${DIRTARGET}
----------------------------------------------"
fi

############################################################################
##END OF BASH SCRIPT...
############################################################################