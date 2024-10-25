#!/bin/bash
############################################################################
############################ STDOUT FUNCTION ###############################
############################################################################
#Author: Willian T.A.F. Silva (willian.silva@evobiolab.com).
############################################################################
##SCRIPT DESCRIPTION:

##Description:
##Show useful commands.

##Input: NONE
##Output: List of useful commands.

##Usage: 
##help-stdout.sh 

############################################################################
##ACTIONS:

echo '----------------------------> USEFUL COMMANDS <-----------------------------
---> Full path to file/directory: 
readlink -f <FILE/DIRECTORY>

---> Count lines:
<INPUT> | wc -l

---> List all variables and functions:
declare | less

---> BASH script arguments:
Script location: $0
First argument: $1
Second argument: $2
Last argument: "${@:$#}" or "${@: -1}"
All but last argument: "${@:$#}"
From third argument to last: "${@:3}"
All arguments: "$@"

---> 

---> 

---> 

---> 

---> 

---> 

---> 

---> 

---> 

---> IMPORTANT PATHS:

Home directory: ${HOME}
Project home directory: ${PROJHOME}

My scripts directory: ${PATHTOMYSCRIPTS}
My SBATCH scripts: ${PATHTOMYSBATCHSCRIPTS}
My general scripts: ${PATHTOMYGENERALSCRIPTS}
My bash profiles: ${PATHTOMYBASHPROFILES}
My submitted scripts: ${PATHTOMYSUBMITTEDSCRIPTS}
My SLURM directory: ${PATHTOMYSLURM}

Project working directory: ${PATHTOPROJWORKINGDIR}
Project output directory: ${PATHTOPROJOUTPUT}
Project TMP directory: ${PATHTOPROJTMP}
Trash directory (used in rm-stdout.sh): ${PATHTOPROJTRASH}

Reference genome (Gal6): ${REFGAL6}
Reference genome (Gal7b): ${REFGAL7B}
Reference genome (GRCh38): ${REFHOMOGRCh38}
Chicken consortium data (.bcf): ${CC5KBCF}
' | less +G

############################################################################
##END OF BASH SCRIPT...
############################################################################