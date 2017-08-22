#!/bin/sh
#
# Creates a configuration file so that other files can access global options.
# Generally, this command doesn't need to be used, as pr_install internally uses it.
# However! If the config file gets accidentally deleted, you can use this command
# then to replace the it with a new, empty one.
#
# Usage:
#
#   pr_config_create
#

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

# Where to put the photos for social media purposes.
social_media_folder=

EOF
