#!/bin/sh

echo "Still in development"
exit 1

load the config file

pr_dir=${pr_project_directory}

check if pr_dir exists else exit

git -C ${pr_dir} pull origin master
newest_tag=$(git describe --tags)

echo Using the latest release ${newest_tag}
git -C ${pr_dir} checkout tags/${newest_tag}
