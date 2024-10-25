#!/bin/bash -l
############################################################################
############################ STDOUT FUNCTION ###############################
############################################################################
#Author: Willian T.A.F. Silva (willian.silva@evobiolab.com).
############################################################################
##SCRIPT DESCRIPTION:

##Description:
##View slurm file of an SBATCH job.

##Input: SBATCH job ID.
##Output: Print slurm file of the SBATCH job.

##Usage: 
##jobslurm-stdout.sh <JOB ID>

############################################################################
##ACTIONS:

##Input.
JOBID=$1

##Process.
less $(ls ${PATHTOMYSLURM}/* | grep ${JOBID}) 
#scontrol write batch_script ${JOBID} - #Alternative.

############################################################################
##END OF BASH SCRIPT...
############################################################################