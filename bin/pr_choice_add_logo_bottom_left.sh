#!/bin/sh
#
# Add a logo to the bottom left corner of the photo. Takes the
#
# - First argument: Indicate the folder path to the Client's Project folder.
#
# Usage:
#
#   pr_choice_add_logo_bottom_left path/to/ClientName
#

echo "Please type out the clients name (the folder name of the client)."
echo "It should be without spaces."
read client_name

if [ -z "$client_name" ]; then
    echo "No client name provided. Stopping."
    exit 1
fi

# Load the config file.
. ~/bin/pr_config_load.sh

client=$client_folder/$client_name
if [ ! -d $client ]; then
    echo "This folder $client does not exist. Is there maybe a typo in the name?"
    exit 1
fi

echo "Adding a logo to ${client_name}'s chosen photos."

orig_photos_folder=$client/Photos/low-res/bottom-left
with_logo_photos_folder=$client/Photos/with-logo/bottom-left

echo "NOTE: Cleaning out with-logo/bottom-left photos."
find $with_logo_photos_folder -iname "*" -type f -delete

echo "Copying over all low-res/bottom-left photos into with-logo/bottom-left folder."
cp $orig_photos_folder/* $with_logo_photos_folder/

# test if logo exists
logo=$client_folder/Photos/logo/logo.png

if [ ! -f $logo ]; then
    echo "The logo file $logo does not exist. Make sure it is in the Photos/logo folder."
fi

# Add the logo
mogrify -gravity southwest -draw "image over 0,10 0,0 $logo" $with_logo_photos_folder/*.jpg
