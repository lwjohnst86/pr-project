#!/bin/sh
# Installs the programs used for doing photography client work
# (aka for Phoenix Rising).
#
# Usage:
#   sh ~/pr-project/bin/pr_install
#

# Create a folder called bin.
mkdir -p ~/bin/

# Remove left over pr_* commands
find ~/bin/ -iname "pr_*" -delete

# Make a link of the commands into the bin folder.
command_folder=$(pwd $(dirname "$0"))
echo ${command_folder}

# Make it so these commands can be executed.
find ${command_folder}/ -iname "pr_*" -exec chmod 766 {} \;
ln -sf ${command_folder}/pr_* ~/bin/

# Put the bin on the search PATH
if [ -f ~/.profile ]; then
    if ! grep -Fxq 'PATH=$PATH:~/bin' ~/.profile
    then
        echo 'PATH=$PATH:~/bin' >> ~/.profile
        echo "Please close and reopen your terminal."
    fi
else
    echo 'PATH=$PATH:~/bin' >> ~/.profile
    echo "Please close and reopen your terminal."
fi

sh $command_folder/pr_config_create

echo "# Location of the installed git repo
install_folder=$command_folder" >> ~/.pr_config.txt
