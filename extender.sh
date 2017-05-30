#! /bin/sh

PATH=$(npm bin):$PATH

if [ "$1" = 'submit' ]; then
	set -- "${@:1:2}" "sign" "${@:4}"
	OK="Your add-on has been submitted for review."
	web-ext "$@" | sed -n "s/\($OK\).*$/\1/;1,/$OK/p" | perl -pe 'BEGIN {$s=1} END { exit $s } $s=0 if /'"$OK"'/;'
else
	web-ext "$@"
fi