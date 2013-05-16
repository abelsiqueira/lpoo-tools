#!/bin/bash

touch ~/.ssh/config
if grep -w "###BEGIN HOSTS###" ~/.ssh/config &> /dev/null; then
  begin=$(grep -nw "###BEGIN HOSTS###" ~/.ssh/config | awk -F: '{print $1}')
  end=$(grep -nw "###END HOSTS###" ~/.ssh/config | awk -F: '{print $1}')
  sed -i "$begin,${end}d" ~/.ssh/config
fi

cat >> ~/.ssh/config << EOF
###BEGIN HOSTS###
$(awk '/^143.106.118.[0-9]* ..*/ {printf "Host %s\nHostName %s\n", $2, $1}' hosts.current)
###END HOSTS###
EOF

cat ~/.ssh/config

