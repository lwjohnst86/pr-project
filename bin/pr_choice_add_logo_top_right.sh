
echo "Still in development"
exit 1

# Load the config file.
pr_config_load

folder_location=$1

if [ ! -d $folder_location]; then
    echo "This folder $folder_location does not exist. Is there maybe a typo?"
    exit 1;
fi

# test if logo exists
logo=../logo/logo.png

if [ ! -f $logo ]; then
    echo "The logo file $logo does not exist. Make sure it is in the Photos/logo folder."
fi

# make sure folder location is bottom-left
mogrify -gravity northeast -draw "image over 0,10 0,0 $logo" ./with-logo/bottom-
left/*.jpg
