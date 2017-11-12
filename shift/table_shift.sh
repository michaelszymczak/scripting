#!/bin/bash

#. ../common.sh

generate_mapping() {
  local input="$1"
  local delimiter="$2"
  local key_collumns="$3"
  keys=$(echo "$input" | cut -d"$delimiter" -f"$key_collumns" | sort | uniq | nl -nln | sed "s/\(^[0-9]\+\)[[:space:]]\+\(.*\)$/\2 => /" | grep "=>")

  local line_num=1
  while IFS= read -r line ; do
    printf "%s" "$line"
    for (( i=1; i<=line_num; i++))
	do
		printf "%s" "$delimiter"
	done
    printf "\n"
    line_num=$((line_num + 1))
  done <<< "$keys"
}


# ######################################################################


