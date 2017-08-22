#!/bin/sh
#
# Loads the config file.
#
# Usage:
#   pr_config_load

# Check if file exists before trying to load it.
if [ ! -f ~/.pr_config.txt ]; then
    echo "Your configuration file is missing! Ask for help :)"
    echo "Or maybe you moved is somewhere else. The file should be called .pr_config.txt."
    exit 1
else
    # Loads the options in the config file.
    echo "Loading the configurations file."
    . ~/.pr_config.txt
    echo "... Loaded."
fi

if [ -z "$client_folder" ]; then
    echo "client_folder option is not set in the .pr_config.txt file."
    echo "Please fill it out."
    exit 1
fi

if [ -z "$template_folder" ]; then
    echo "template_folder option is not set in the .pr_config.txt file."
    echo "Please fill it out."
    exit 1
fi

if [ -z "$social_media_folder" ]; then
    echo "social_media_folder option is not set in the .pr_config.txt file."
    echo "Please fill it out."
    exit 1
fi
