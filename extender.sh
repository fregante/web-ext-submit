#! /bin/bash

# find location of web-ext (dependency)
cd "$(dirname "$0")/$(dirname "$(readlink "$0")")" || exit
PATH=$(npm bin):$PATH
cd - > /dev/null || exit

# redirect 'sign'+output parsing
set -- "sign" "${@:1}" # https://stackoverflow.com/a/4827707/288906
tmp="$(mktemp)"
ok="Your add-on has been submitted for review."
web-ext "$@" | sed -n "s/\($ok\).*$/\0/;1,/$ok/p" | tee "$tmp"
error=${PIPESTATUS[0]}
if ! grep -q "$ok" "$tmp" && [ $error = 1 ] ; then
	exit $error
fi
