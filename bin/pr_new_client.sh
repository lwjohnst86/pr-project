#!/bin/sh

echo "Still in development"

# Check to see if the config file exists and load it if it is.
if [ ! -f ~/.pr_config.txt ]; then
    echo "Your configuration file is missing! Ask for help :)"
else
    . ~/.pr_config.txt
fi

# TODO: check if master directory, etc of the config variables exist

# Get the name of the client to use as the base for the
echo "What is the name of the client (no spaces). Recommended use is CamelCase (eg JimmyTimmy)."
read client_name

# Create the folder directory structure.
new_client=${client_folder}/${client_name}
mkdir $new_client
mkdir $new_client/Photos/
mkdir $new_client/Documents/
mkdir $new_client/Photos/photographer-selection
mkdir $new_client/Photos/client-choice
mkdir $new_client/Photos/photographer-selection/logo # Keep logo?
mkdir $new_client/Photos/photographer-selection/raw
mkdir $new_client/Photos/photographer-selection/proofs

mkdir $new_client/Photos/client-choice/raw
mkdir $new_client/Photos/client-choice/with-logo
mkdir $new_client/Photos/client-choice/full-res
mkdir $new_client/Photos/client-choice/raw/bottom-right
mkdir $new_client/Photos/client-choice/raw/bottom-left
mkdir $new_client/Photos/client-choice/raw/top-right
mkdir $new_client/Photos/client-choice/raw/top-left
mkdir $new_client/Photos/client-choice/with-logo/bottom-right
mkdir $new_client/Photos/client-choice/with-logo/bottom-left
mkdir $new_client/Photos/client-choice/with-logo/top-right
mkdir $new_client/Photos/client-choice/with-logo/top-left
touch $new_client/Photos/client-choice/photo-numbers-from-selection.txt
touch $new_client/Photos/client-choice/photo-numbers-for-branding.txt

exit 1

# TODO: check if contract and model release files exist.
cp $template_folder/Contract Documents/
cp $template_folder/Model-Release-Form Documents/
touch Documents/visioning.txt
