#!/bin/sh
# Installs the programs used for doing photography client work
# (aka for Phoenix Rising)

echo "NOTE: This project is in development, so may not work as expected!"

# Create a folder called bin.
mkdir -p ~/bin/

# Make a link of the commands into the bin folder.
command_folder=$(dirname "$0")
ln -sf ${command_folder}/*.sh ~/bin/

# TODO? Rename so commands don't have sh?

# Make it so these commands can be executed.
find ~/bin/ -iname "pr_*" -exec chmod 744 {} \;

# Put the bin on the search PATH
if [ -f ~/.profile ]; then
    if ! grep -Fxq 'PATH=$PATH:~/bin' ~/.profile
    then
        echo 'PATH=$PATH:~/bin' >> ~/.profile
    fi
else
    echo 'PATH=$PATH:~/bin' >> ~/.profile
fi

sh $command_folder/pr_config_create.sh
