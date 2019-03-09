#!/bin/sh

if [ $1 = "--normal" ]; then
	for arg in "$@"; do
		echo "$arg"
	done
	exit 0
elif [ $1 = "--reverse" ]; then
	VAR=""
	for arg in "$@"; do
		VAR="$arg"'
'"$VAR"
	done
	echo "$VAR" | head -n-1
	exit 0
elif [ $1 = "--subst" ]; then
	pattern=$2
	subst=$3
	shift 3
	for arg in "$@"; do
		echo ${arg//$pattern/$subst}
	done
	exit 0
elif [ $1 = "--len" ]; then
	VAR=${#1}
	shift
	for arg in "$@"; do
		VAR="$VAR ${#arg}"
	done
	echo "$VAR"
	exit 0
elif [ $1 = "--help" ]; then
	echo "uloha02.sh [OPTION] [args]"
	echo "   --normal   Repeats all parameters each on seperate line."
	echo "   --reverse  Repeats all parameters in reverse order each on seperate line."
	echo "   --subst    Expects: [PAT] [SUB] [param], PAT being a string to look for and be replaced with SUB in param. Each parameter is printed on seperate line."
	echo "   --len      Calculates length of every parameter including option."
	exit 0
else
	echo "Unknown command!"
	exit 0
fi
