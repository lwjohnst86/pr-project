#!/bin/sh

echo "Still in development"

# Load the config file.
pr_config_load

# TODO: check if master directory, etc of the config variables exist

# Get the name of the client to use as the base for the
echo "What is the name of the client (no spaces). Recommended use is CamelCase (eg JimmyTimmy)."
read client_name

# Create the folder directory structure.
new_client=${client_folder}/${client_name}
mkdir $new_client
mkdir $new_client/Photos/
mkdir $new_client/Documents/
mkdir $new_client/Photos/raw
mkdir $new_client/Photos/logo
mkdir $new_client/Photos/photographer-selection
mkdir $new_client/Photos/photographer-selection/raw
mkdir $new_client/Photos/photographer-selection/proofs

mkdir $new_client/Photos/client-choice
mkdir $new_client/Photos/client-choice/full-res
mkdir $new_client/Photos/client-choice/raw
mkdir $new_client/Photos/client-choice/raw/bottom-right
mkdir $new_client/Photos/client-choice/raw/bottom-left
mkdir $new_client/Photos/client-choice/raw/top-right
mkdir $new_client/Photos/client-choice/raw/top-left
mkdir $new_client/Photos/client-choice/with-logo
mkdir $new_client/Photos/client-choice/with-logo/bottom-right
mkdir $new_client/Photos/client-choice/with-logo/bottom-left
mkdir $new_client/Photos/client-choice/with-logo/top-right
mkdir $new_client/Photos/client-choice/with-logo/top-left
touch $new_client/Photos/client-choice/photo-numbers-from-selection.txt
touch $new_client/Photos/client-choice/photo-numbers-for-branding.txt

# Move the template files (contract, release form, etc) into the Document folder.
# TODO: check if contract and model release files exist.
# TODO: confirm that contract and release form are docx files
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
