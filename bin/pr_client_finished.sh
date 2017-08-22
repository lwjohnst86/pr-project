
# Steps to take
# - delete all raw files
# - compress and zip
# - rename to include the date of completion
# - delete original folder

echo "In development"
exit 1

cp $client ${client}.bak
rm -rf $client/Photos/raw/*
zip $client

mv ${client}.zip ${client}-${date}.zip
rm -rf $client/
