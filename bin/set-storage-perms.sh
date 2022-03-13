#!/bin/sh

if [ $# -ne 2 ]
then
	echo "Usage: $0 <directory> <group> [<group-writeable>]"
	exit
fi

DIRPERMS='2775'
FILEPERMS='664'

if [ $3 -eq 1 ]
then
	# not sure what I was planning here

fi
	
		


find $1 -type d -exec echo chmod $DIRPERMS {} \;
find $1 -type f -exec echo chmod $FILEPERMS {} \;
find $1 -exec echo chgrp $2 {} \;

