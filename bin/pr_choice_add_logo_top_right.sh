#!/bin/sh
#
# Add a logo to the top right corner of the photo. Takes the
#
# - First argument: Indicate the folder path to the Client's Project folder.
#
# Usage:
#
#   pr_choice_add_logo_top_right path/to/ClientName
#
echo "Still in development"
exit 1

client_folder=$1
if [ ! -d $client_folder]; then
    echo "This folder $client_folder does not exist. Is there maybe a typo?"
    exit 1
fi

# Load the config file.
pr_config_load

echo "Adding a logo to $(basename $client_folder)'s chosen photos."

raw_photos_folder=$client_folder/Photos/raw/top-right/
with_logo_photos_folder=$client_folder/Photos/with-logo/top-right/

echo "NOTE: Cleaning out with-logo/top-right photos."
rm $with_logo_photos_folder/*

echo "Copying over all raw/top-right photos into with-logo/top-right folder."
cp $raw_photos_folder/* $with_logo_photos_folder/

# test if logo exists
logo=$client_folder/Photos/logo/logo.png

if [ ! -f $logo ]; then
    echo "The logo file $logo does not exist. Make sure it is in the Photos/logo folder."
fi

# Add the logo
mogrify -gravity northeast -draw "image over 0,10 0,0 $logo" $with_logo_photos_folder/*.jpg
