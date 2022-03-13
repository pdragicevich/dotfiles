#!/bin/bash

# rsync options
# -r recurse into directories
# -v increase verbosity
# -h human readable sizes
# -P partial & progress
# -t preserve modification times
# (-n dry run)

# A trailing slash on the source changes this behavior to avoid creating an additional directory level at the destination.
# rsync -av /src/foo /dest
# rsync -av /src/foo/ /dest/foo

source=/mnt/storage
dest=/media/paul/Backup/Backup/TERMINUS/storage
dirs=( download ebooks Hyper-V mp3 multimedia paul truecrypt tv )

for d in "${dirs[@]}"
do
    echo '***' Backing up $source/$d
    rsync -rvhPt --delete $source/$d $dest
done
