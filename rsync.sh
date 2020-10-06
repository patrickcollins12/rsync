#!/bin/sh

EXC_DOC=/tmp/rsyncexc$$.txt
cat > $EXC_DOC <<EOM
Backups.backupdb
._.*
.com.apple*
.Trashes
.DS_Store
.fseventsd
.Spotlight-V100
EOM

echo "Excluding"
echo "---------"
cat $EXC_DOC

rsync -av --progress --exclude-from $EXC_DOC --delete /Volumes/primary\ HFS/* /Volumes/boxeedisk
