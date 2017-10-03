#!/bin/sh
#

usage() {
    echo "
    Arguments (need to include them all): $0
        -i Input folder for the photos
        -o Output folder for the shrunk and logo'd photos
        -c Corner to add the logo (bottom-right, bottom-left, top-right, top-left}
        -l Relative path to logo image file
        -r The resolution to use
        " 1>&2
    exit 1
}

while getopts ":i:o:c:l:d:r:h:" opt; do
  case ${opt} in
    i) input=${OPTARG}
    ;;
    o) output=${OPTARG}
    ;;
    c) corner=${OPTARG}
    ;;
    l) logo_path=${OPTARG}
    ;;
    r) resolution=${OPTARG}
    ;;
    h|*) usage
    ;;
  esac
done

if [ -z $input -o -z $output -o -z $corner -o -z $logo_path -o -z $resolution]; then
    usage
fi

mogrify -path $output -resize $resolution -gravity $corner -draw "image over 0,10 0,0 $logo_path" $input

