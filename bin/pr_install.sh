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

# Check if the config file already exists.
config_file=~/.pr_config.txt
if [ -f $config_file ]; then
    echo "The $config_file already exists, not creating a new one."
    exit 1
fi

# Create a config file with the necessary contents.
cat > $config_file <<EOF
## This file tells pr_ type commands to use these folders

# Type out the filepath where you want the new client folders to be created in
# (for instance, in the external hard drive)
client_folder=

# Where all the template files (logos, contracts, model release, etc) are located.
template_folder=

# Where to put the photos for branding purposes.
branding_folder=

EOF
