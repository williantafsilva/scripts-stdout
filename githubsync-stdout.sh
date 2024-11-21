#!/bin/bash -l
##Add -l to the shebang to inherit bash profile variables and configuration.
############################################################################
############################ STDOUT FUNCTION ###############################
############################################################################
#Author: Willian T.A.F. Silva (willian.silva@evobiolab.com).
############################################################################

echo "---> Synchronizing GitHub repositories..."

#Configure Git.
#cd ${HOME}
#git config --list --show-origin #Check current configuration.
#git config --global user.name "Willian Silva"
#git config --global user.email willian.silva@evobiolab.com
#Set up GitHub authentication via SSH.
#cd ${HOME}
#ssh-keygen -t ed25519 -C "willian.silva@evobiolab.com" #Create SSH key (add "_github" to the file name when prompted and use no password).
#eval "$(ssh-agent -s)" #Start SSH agent in the background.
#ssh-add ~/.ssh/id_ed25519_github #Add your SSH private key to the ssh-agent.
#ssh-add -l -E sha256 #Verify that you have a private key generated and loaded into SSH.
#Add the SSH public key to your account on GitHub (for authetication) (https://docs.github.com/en/authentication/connecting-to-github-with-ssh/adding-a-new-ssh-key-to-your-github-account).
#ssh -T git@github.com #Verify you can connect to GitHub.
#ssh-add -l -E md5 #Verify that list of SSH keys on GitHub matches the output from the ssh-add command.
#Clone GitHub depositories (first time only).
#git clone git@github.com:williantafsilva/bashprofiles.git
#git clone git@github.com:williantafsilva/scripts-sbatch.git
#git clone git@github.com:williantafsilva/scripts-R.git
#git clone git@github.com:williantafsilva/scripts-Python.git
#git clone git@github.com:williantafsilva/scripts-stdout.git
#git clone git@github.com:williantafsilva/bioinformatics-workflow.git
#git clone git@github.com:williantafsilva/scripts-tmp.git

#Update all GitHub depositories. Create a separate script for this to avoid errors when using scp.
eval "$(ssh-agent -s)" #Start SSH agent in the background.
ssh-add ~/.ssh/id_ed25519_github #Add your SSH private key to the ssh-agent.

echo "---> Synchronizing bashprofiles ..."
cd ${PATHTOMYBASHPROFILES}
git stash
git pull origin

echo "---> Synchronizing scripts-sbatch ..."
cd ${PATHTOMYSBATCHSCRIPTS}
git stash
git pull origin

echo "---> Synchronizing scripts-R ..."
cd ${PATHTOMYRSCRIPTS}
git stash
git pull origin

echo "---> Synchronizing scripts-Python ..."
cd ${PATHTOMYPYTHONSCRIPTS}
git stash
git pull origin

echo "---> Synchronizing scripts-stdout ..."
cd ${PATHTOMYGENERALSCRIPTS}
git stash
git pull origin

echo "---> Synchronizing bioinformatics-workflow ..."
cd ${PATHTOMYWORKFLOW}
git stash
git pull origin

echo "---> Synchronizing scripts-tmp ..."
cd ${PATHTOMYTMPSCRIPTS}
git stash
git pull origin

cd ${HOME}