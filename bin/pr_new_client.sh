#!/bin/sh

echo "Still in development"
exit 1

check if config file exists

load in config file

check if master directory, etc of the config variables exist

client_dir=${client_folder}

echo what is the name of the client (no spaces please. recommended would use CamelCase (for example JimmyTimmy))
read client_name

new_client=${client_folder}/${client_name}
mkdir ${CLIENT_DIR}/Photos Documents
mkdir ${CLIENT_DIR}/Photos/{photographer-selection,client-choice}
touch ${CLIENT_DIR}/Photos/photographer-selection/photo-numbers-from-raw.txt
mkdir ${CLIENT_DIR}/Photos/photographer-selection/{raw,proofs,logo} # Keep logo?

mkdir ${CLIENT_DIR}/Photos/client-choice/{raw,with-logo,full-res}
mkdir ${CLIENT_DIR}/Photos/client-choice/raw/{bottom-right,bottom-left,top-right,top-left}
touch ${CLIENT_DIR}/Photos/client-choice/photo-numbers-from-selection.txt
touch ${CLIENT_DIR}/Photos/client-choice/photo-numbers-for-branding.txt

cp $TEMPLATE_FOLDER/Contract Documents/
cp $TEMPLATE_FOLDER/Model-Release-Form Documents/
touch Documents/visioning
