#!/usr/bin/env sh

for _D in $(find /dev -type b -name "[sv]d*[a-z]" 2>/dev/null)
do
  _I=0
  for _T in 'cat /etc/fstab' 'blkid' 'pvs'
  do
    [ -z "$($_T 2>/dev/null | grep $_D)" ] && _I=$(expr $_I + 1)
    [ $_I -eq 3 ] && echo $_D
  done
done

[ -z "$_D" ] && echo ''

exit 0
