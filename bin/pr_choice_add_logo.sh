#!/bin/sh
#
# Add a logo to the top right corner of the ph
#

usage() {
    echo "
    Arguments: $0
        -n Client name, without spaces. (Required)
        -d Delete output folder. Either true or false. Default is true.
        " 1>&2
    exit 1
}

while getopts ":n:hd" opt; do
    case ${opt} in
        n) client_name=${OPTARG}
        ;;
        d) delete_output=${OPTARG}
        ;;
        h|*) usage
        ;;
    esac
done

if [ -z "$client_name" ]; then
    usage
fi

# Load the config file.
. ~/bin/pr_config_load*

client=$client_folder/$client_name
if [ ! -d $client ]; then
    echo "Folder $client does not exist."
    usage
fi

input=$client/Photos/client-choice/full-res
output=$client/Photos/client-choice/with-logo

if [ -z $delete_output -o $delete_output == "true" ]; then
    find $output -iname "*" -type f -delete
fi

if [ ! -f $client/Photos/logo/logo.png ]; then
    echo "Logo in Photos/logo/logo.png does not exist."
    exit 1
fi

for photo_folder in bottom-right bottom-left top-right top-left
do
    input_folder=$input/$photo_folder
    if [ ! -d $input_folder ]; then
        echo "Folder $input_folder does not exist."
        exit 1
    fi

    case $photo_folder in
        bottom-right) logo_corner=southeast;;
        bottom-left) logo_corner=southwest;;
        top-right) logo_corner=northeast;;
        top-left) logo_corner=northwest;;
    esac

    for photos in $input_folder/*
    do
        # test if landscape (=1) or portrait/square (=0)
        orientation_test=`convert ${photos} -format "%[fx:(w/h>1)?1:0]" info:`

        if [ $orientation_test -eq 1 ]; then
            # Landscape (=1)
            resolution=x2048
        else
            # Portrait or square (=0)
            resolution=2048x
        fi
        logo=../../logo/logo.png
        (cd $input_folder && pr_utility_shrink_add_logo -i ./ -o $output -c $logo_corner -r $resolution -l $logo)
    done
done
