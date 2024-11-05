#!/bin/bash -l
############################################################################
############################ STDOUT FUNCTION ###############################
############################################################################
#Author: Willian T.A.F. Silva (willian.silva@evobiolab.com).
############################################################################
##SCRIPT DESCRIPTION:

##Description:
##Move target files/directories to the project tmp directory (${PATHTOPROJTMP}).

##Input: Target files/directories.
##Output: Move target files/directories to the project tmp directory.
##Use fromtmp-stdout.sh <TAG> to move target files/directories the specified directory.

##Usage: 
##totmp-stdout.sh <TARGET DIRECTORY>

############################################################################
##ACTIONS:

RUNDATE=$(date +"%Y%m%d%H%M%S")

##Input.
INPUT="$@"

##Process.

#Recovery tag and directory name.
RECOVERYDIRNAME=$(echo "tmp-${RUNDATE}-$(tr -dc A-Za-z0-9 </dev/urandom | head -c 10)")
RECOVERYDIR=$(echo "${PATHTOPROJTMP}/${RECOVERYDIRNAME}")

#Create tmp recovery directory.
mkdir -p ${RECOVERYDIR} 

#Move input files/directories.
mv ${INPUT} ${RECOVERYDIR} 

echo "----------------------------------------------
The following files/directories can now be found in ${RECOVERYDIR}:
$(find ${INPUT} -maxdepth 0)

To recover the files/directories above, use:
\$ fromtmp-stdout.sh <OUTPUT LOCATION> ${RECOVERYDIRNAME}
----------------------------------------------"

############################################################################
##END OF BASH SCRIPT...
############################################################################