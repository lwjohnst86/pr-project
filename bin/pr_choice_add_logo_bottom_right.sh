#!/bin/sh
#
# Add a logo to the bottom right corner of the photo. Takes the
#
# - First argument: Indicate the folder path to the Client's Project folder.
#
# Usage:
#
#   pr_choice_add_logo_bottom_right path/to/ClientName
#
echo "Still in development"

client_folder=$1
if [ ! -d $client_folder]; then
    echo "This folder $client_folder does not exist. Is there maybe a typo?"
    exit 1
fi

# Load the config file.
. ~/bin/pr_config_load.sh

echo "Adding a logo to $(basename $client_folder)'s chosen photos."

raw_photos_folder=$client_folder/Photos/raw/bottom-right/
with_logo_photos_folder=$client_folder/Photos/with-logo/bottom-right/

echo "NOTE: Cleaning out with-logo/bottom-right photos."
rm $with_logo_photos_folder/*

echo "Copying over all raw/bottom-right photos into with-logo/bottom-right folder."
cp $raw_photos_folder/* $with_logo_photos_folder/

# test if logo exists
logo=$client_folder/Photos/logo/logo.png

if [ ! -f $logo ]; then
    echo "The logo file $logo does not exist. Make sure it is in the Photos/logo folder."
fi

# Add the logo
mogrify -gravity southeast -draw "image over 0,10 0,0 $logo" $with_logo_photos_folder/*.jpg
