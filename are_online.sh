#!/bin/bash

for host in $(awk '/^143.106.118/ {print $2}' /etc/hosts)
do
  if ping $host -c 1 &> /dev/null; then
    echo -e "$host is \e[0;32monline\e[0m"
  else
    echo -e "$host is \e[0;31moffline\e[0m"
  fi
done
