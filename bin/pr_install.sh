#!/bin/sh

echo "This project is not complete, can't install anything!"
exit 1

# create a folder called bin
mkdir ~/bin/

symlink all pr_* files into ~/bin/ folder.
rename all pr_* files so there is not a file extension

chmod all files to 744


# Create a config file

config_file=.pr_config.txt

if file exists $config_file
then echo this file already exists
exit 1

cat > $proj_dir/.gitignore <<EOF
## This file tells git to ignore the following files and folders:
*~
.~*
output/
figure/
auto/
*.el
*.tex
EOF

have a .pr_config.txt file
- to indicate which directory to create the files in (Locura, etc)
- where to keep branding, etc
- where template files are (logo, etc)

