#!/bin/bash
############################################################################
############################ STDOUT FUNCTION ###############################
############################################################################
#Author: Willian T.A.F. Silva (willian.silva@evobiolab.com).
############################################################################
##SCRIPT DESCRIPTION:

##Description:
##Retrieve the number of pending, running, completed, failed and cancelled sbatch jobs submitted by the user.

##Input: NONE.
##Output: Number of pending, running, completed, failed and cancelled sbatch jobs submitted by the user.

##Usage: 
##njobs-stdout.sh

############################################################################
##ACTIONS:

##Process.

NPENDING=$(sacct --format="JobID,Partition,JobName%30,User,State,Elapsed,ExitCode" | grep -v ".ext+" | grep -v ".ex+" | grep -v ".bat+" | grep -v ".ba+" | grep "PENDING" | wc -l)
NRUNNING=$(sacct --format="JobID,Partition,JobName%30,User,State,Elapsed,ExitCode" | grep -v ".ext+" | grep -v ".ex+" | grep -v ".bat+" | grep -v ".ba+" | grep "RUNNING" | wc -l)
NCOMPLETED=$(sacct --format="JobID,Partition,JobName%30,User,State,Elapsed,ExitCode" | grep -v ".ext+" | grep -v ".ex+" | grep -v ".bat+" | grep -v ".ba+" | grep "COMPLETED" | wc -l)
NFAILED=$(sacct --format="JobID,Partition,JobName%30,User,State,Elapsed,ExitCode" | grep -v ".ext+" | grep -v ".ex+" | grep -v ".bat+" | grep -v ".ba+" | grep "FAILED" | wc -l)
NTIMEOUT=$(sacct --format="JobID,Partition,JobName%30,User,State,Elapsed,ExitCode" | grep -v ".ext+" | grep -v ".ex+" | grep -v ".bat+" | grep -v ".ba+" | grep "TIMEOUT" | wc -l)
NCANCELLED=$(sacct --format="JobID,Partition,JobName%30,User,State,Elapsed,ExitCode" | grep -v ".ext+" | grep -v ".ex+" | grep -v ".bat+" | grep -v ".ba+" | grep "CANCELLED" | wc -l)
NOUTOFMEMORY=$(sacct --format="JobID,Partition,JobName%30,User,State,Elapsed,ExitCode" | grep -v ".ext+" | grep -v ".ex+" | grep -v ".bat+" | grep -v ".ba+" | grep "OUT_OF_MEMORY" | wc -l)

echo "----------------------------------------------------------------------------
SUBMITTED JOBS (User: ${USER})
PENDING: ${NPENDING}
RUNNING: ${NRUNNING}
COMPLETED: ${NCOMPLETED}
FAILED: ${NFAILED}
TIMEOUT: ${NTIMEOUT}
OUT OF MEMORY: ${NOUTOFMEMORY}
CANCELLED: ${NCANCELLED}
----------------------------------------------------------------------------"
if [[ $((${NPENDING} + ${NRUNNING})) -gt 20 ]] ; then 
	if [[ ${NRUNNING} -le 20 ]] && [[ ${NPENDING} -le 20 ]] ; then
		sacct --format="JobID,Partition,JobName%30,User,State,Elapsed,ExitCode" | grep -v ".ext+" | grep -v ".ex+" | grep -v ".bat+" | grep -v ".ba+" | grep "RUNNING\|JobID"
		echo "----------------------------------------------------------------------------"
	elif [[ ${NRUNNING} -le 20 ]] && [[ ${NRUNNING} -gt 0 ]] && [[ ${NPENDING} -ge 20 ]] ; then
		sacct --format="JobID,Partition,JobName%30,User,State,Elapsed,ExitCode" | grep -v ".ext+" | grep -v ".ex+" | grep -v ".bat+" | grep -v ".ba+" | grep "RUNNING\|JobID"
		echo "----------------------------------------------------------------------------"
	elif [[ ${NRUNNING} -ge 20 ]] && [[ ${NPENDING} -le 20 ]] && [[ ${NPENDING} -gt 0 ]] ; then
		sacct --format="JobID,Partition,JobName%30,User,State,Elapsed,ExitCode" | grep -v ".ext+" | grep -v ".ex+" | grep -v ".bat+" | grep -v ".ba+" | grep "PENDING\|JobID"
		echo "----------------------------------------------------------------------------"
	fi
elif [[ ${NRUNNING} -gt 0 ]] || [[ ${NPENDING} -gt 0 ]] ; then
	sacct --format="JobID,Partition,JobName%30,User,State,Elapsed,ExitCode" | grep -v ".ext+" | grep -v ".ex+" | grep -v ".bat+" | grep -v ".ba+" | grep "RUNNING\|PENDING\|JobID"
	echo "----------------------------------------------------------------------------"
fi

############################################################################
##END OF BASH SCRIPT...
############################################################################