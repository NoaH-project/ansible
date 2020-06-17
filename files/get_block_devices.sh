#!/usr/bin/env sh

PATH=/usr/sbin:/usr/bin:/sbin:/bin
LC_ALL=C

_blkid=$(which blkid)
_sed=$(which sed)
_reg='/LABEL="app"/!d;s/^\(.*\):.*UUID=.\(.*\). UUID.*/\1\n\2/'

[ -x "$_blkid" ] || exit 1
[ -x "$_sed" ]   || exit 2

$_blkid | $_sed "$_reg"
