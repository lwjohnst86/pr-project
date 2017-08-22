#!/bin/sh
#
# Creates a new folder structure with template files for a new client.
#
# Usage:
#
#   pr_new_client

# Get the name of the client to use as the base for the
echo "What is the name of the client (no spaces). Recommended use is CamelCase (eg JimmyTimmy)."
read client_name

if echo $client_name | grep -E '[ "]' >/dev/null; then
  echo "There are spaces in the name. Stopping."
  exit 1
fi

# Load the config file.
. ~/bin/pr_config_load*

# Create the folder directory structure.
new_client=${client_folder}/${client_name}
mkdir -v $new_client
mkdir $new_client/Photos/
mkdir $new_client/Documents/
mkdir $new_client/Photos/raw
mkdir $new_client/Photos/logo
mkdir $new_client/Photos/photographer-selection
mkdir $new_client/Photos/photographer-selection/raw
mkdir $new_client/Photos/photographer-selection/proofs

mkdir $new_client/Photos/client-choice
mkdir $new_client/Photos/client-choice/raw
mkdir $new_client/Photos/client-choice/full-res
mkdir $new_client/Photos/client-choice/full-res/bottom-right
mkdir $new_client/Photos/client-choice/full-res/bottom-left
mkdir $new_client/Photos/client-choice/full-res/top-right
mkdir $new_client/Photos/client-choice/full-res/top-left
mkdir $new_client/Photos/client-choice/with-logo
touch $new_client/Photos/client-choice/photo-numbers-from-selection.csv
touch $new_client/Photos/client-choice/photo-numbers-for-branding.csv

# Move the template files (contract, release form, etc) into the Document folder.
# TODO: confirm with Vero that contract and release form are docx files
contract=$template_folder/Contract.docx
release_form=$template_folder/Model-Release-Form.docx
if [ ! -f $contract ]; then
    echo "Contract file is not found in $template_folder."
    echo "You'll need to copy the contract file manually to the Document folder."
else
    cp $contract $new_client/Documents/
fi

if [ ! -f $release_form ]; then
    echo "Model Release Form file is not found in $template_folder."
    echo "You'll need to copy the release form file manually to the Document folder."
else
    cp $template_folder/Model-Release-Form* $new_client/Documents/
fi

# TODO: confirm that Vero wants this as a text file or maybe like a template file
touch $new_client/Documents/Visioning.txt

# Move the logo into the Photo folder.
logo=$template_folder/logo.png
if [ ! -f $logo ]; then
    echo "Logo $logo file does not exist. Make sure it is in the $template_folder folder."
    echo "You'll need to copy the logo into the appropriate logo folders manually."
else
    cp $logo $new_client/Photos/logo/
fi
