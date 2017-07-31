#!/bin/sh
# Installs the programs used for doing photography client work
# (aka for Phoenix Rising).
#
# Usage:
#   sh ~/pr-project/bin/pr_install.sh
#
echo "NOTE: This project is still in development, so may not work as expected!"

# Create a folder called bin.
mkdir -p ~/bin/

# Make a link of the commands into the bin folder.
command_folder=$(dirname "$0")
ln -sf ${command_folder}/*.sh ~/bin/

# TODO? Rename so commands don't have sh?

# Make it so these commands can be executed.
find ~/bin/ -iname "pr_*" -exec chmod 766 {} \;

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

sh $command_folder/pr_config_create.sh

echo "# Location of the installed git repo
install_folder=$command_folder" >> ~/.pr_config.txt
