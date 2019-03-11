#!/bin/sh

input=$1
if [ "$input" = '--typ' ]; then
	input=$2
	if [ -e "$input" ]; then
		if [ -L "$input" ]; then
			echo "symbolic link"
			exit 0
		elif [ -f "$input" ]; then
			echo "regular file"
			exit 0
		elif [ -d "$input" ]; then
			echo "directory"
			exit 0
		elif [ -b "$input" ]; then
			echo "block special"
			exit 0
		elif [ -c "$input" ]; then
			echo "character special"
			exit 0
		elif [ -p "$input" ]; then
			echo "named pipe"
			exit 0
		else
			echo "unknown file type"
			exit 0
		fi
	else
		echo "File "$input" does not exist!"
		exit 1
	fi
elif [ "$input" = '--help' ]; then
	echo "uloha01.sh [--typ|--help] [path]"
	echo "	--typ	[path] expected, returns type of file given by path"
	echo "	--help	you already figured out"
	exit 0
else
	echo "Unknown command!"
	echo "input="$input
	exit 1
fi
