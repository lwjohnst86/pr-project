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
else
    # Loads the options in the config file.
    . ~/.pr_config.txt
    echo "Loading the configurations file."
fi
