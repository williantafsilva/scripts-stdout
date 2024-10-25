#!/bin/bash -l
############################################################################
############################ STDOUT FUNCTION ###############################
############################################################################
#Author: Willian T.A.F. Silva (willian.silva@evobiolab.com).
############################################################################
##SCRIPT DESCRIPTION:

##Description:
##Create a recovery copy of a directory.

##Input: Target directory.
##Output: Copy of target directory in .screenshots directory. 
##Use screenshot-recover-stdout.sh <SCREENSHOT TAG> to restore the target directory.

##Usage: 
##screenshot-save-stdout.sh <TARGET DIRECTORY>

############################################################################
##ACTIONS:

RUNDATE=$(date +"%Y%m%d%H%M%S")

##Input.
TARGETDIR=$(readlink -f $1)
TARGETDIRLOCATION=${TARGETDIR%/*}

##Process.
echo "----------------------------------------------
CREATING SCREENSHOT OF: 
${TARGETDIR}"

#Screenshot recovery tag and directory.
RANDOMTAG=$(tr -dc A-Za-z0-9 </dev/urandom | head -c 10)
SCREENSHOTRECOVERYTAG=$(echo "${RUNDATE}${RANDOMTAG}")
SCREENSHOTRECOVERYDIR=$(echo "${PATHTOPROJSCREENSHOTS}/${SCREENSHOTRECOVERYTAG}")

#Create screenshot recovery directory.
mkdir -p ${SCREENSHOTRECOVERYDIR} 

#Save copy of the target directory.
cp -R ${TARGETDIR} ${SCREENSHOTRECOVERYDIR}

#Save record.
SCREENSHOTRECORDSFILE=$(echo "${PATHTOPROJSCREENSHOTS}/.screenshotrecords.txt")
if [[ ! -f ${SCREENSHOTRECORDSFILE} ]] ; then
    echo -e "TAG\tORIGIN\tRECOVERED?\tUPDATE
${SCREENSHOTRECOVERYTAG}\t${TARGETDIR}\tNO\t${RUNDATE}" >> ${SCREENSHOTRECORDSFILE}
else
	echo -e "${SCREENSHOTRECOVERYTAG}\t${TARGETDIR}\tNO\t${RUNDATE}" >> ${SCREENSHOTRECORDSFILE}
fi

TARGETDIRRECORDS=$(echo "${TARGETDIRLOCATION}/.screenshotrecords.txt")
if [[ ! -f ${TARGETDIRRECORDS} ]] ; then
    echo -e "TAG\tORIGIN\tRECOVERED?\tUPDATE
${SCREENSHOTRECOVERYTAG}\t${TARGETDIR}\tNO\t${RUNDATE}" >> ${TARGETDIRRECORDS}
else
	echo -e "${SCREENSHOTRECOVERYTAG}\t${TARGETDIR}\tNO\t${RUNDATE}" >> ${TARGETDIRRECORDS}
fi

echo "----------------------------------------------
A screenshot of the following directory was created with the tag ${SCREENSHOTRECOVERYTAG}:
${TARGETDIR}

To recover this version of the directory, use:
\$ screenshot-recover-stdout.sh ${SCREENSHOTRECOVERYTAG}
----------------------------------------------"

############################################################################
##END OF BASH SCRIPT...
############################################################################