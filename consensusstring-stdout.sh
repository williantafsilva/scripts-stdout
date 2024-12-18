#!/bin/bash
############################################################################
############################ STDOUT FUNCTION ###############################
############################################################################
#Author: Willian T.A.F. Silva (willian.silva@evobiolab.com).
############################################################################
##SCRIPT DESCRIPTION:

##Description:
##Show consensus string of two strings.

##Input 1: String 1.
##Input 2: String 2.
##Output: Consensus string, with characters that differ between strings substituted by X.

##Usage: 
##consensusstring-stdout.sh <STRING 1> <STRING 2>

############################################################################
##ACTIONS:

##Input.
STRING1=$1
STRING2=$2

##Process.
CONSENSUS=""
while read C ; do
    C1=$(echo ${C} | cut -f1)
    C2=$(echo ${C} | cut -f2)
    echo "${C}"
    echo "C1:${C1}"
    echo "C2:${C2}"
    if [[ "${C1}" == "${C2}" ]] ; then
        CONSENSUS+="${C1}"
        echo "."
        echo "CONSENSUS:${CONSENSUS}"
    else
        CONSENSUS+="X"
        echo "X"
        echo "CONSENSUS:${CONSENSUS}"
    fi
done <<< "$(paste -d'\t' <(echo ${STRING1} | grep -o .) <(echo ${STRING2} | grep -o .))"
echo "CONSENSUS:${CONSENSUS}"

############################################################################
##END OF BASH SCRIPT...
############################################################################