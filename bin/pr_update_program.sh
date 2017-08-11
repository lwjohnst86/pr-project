#!/bin/sh
#
# Update the commands from the GitHub repository.
#
# Usage:
#
#   pr_update_program
#

# Load config file.
. ~/bin/pr_config_load.sh

if [ ! -d "$install_folder" ]; then
    echo "$install_folder does not exist, did you move the pr-project folder maybe?"
    exit 1
fi

git -C $install_folder reset --hard HEAD
git -C $install_folder pull origin master
# Need to update pr_* symbolic links?
find ~/bin/ -iname "pr_*" -exec chmod 766 {} \;
find ~/bin/ -iname "pr_*" -exec rename 's/\.sh$//' {} \;

# TODO: Use tags? newest_tag=$(git describe --tags)
#echo Using the latest release ${newest_tag}
#git -C ${pr_dir} checkout tags/${newest_tag}
