#!/bin/bash

#. ../common.sh

table_shift::generate_mapping() {
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

table_shift::generate_header() {
  local input="$1"
  local delimiter="$2"
  local key_collumns="$3"
  mapping=$(table_shift::generate_mapping "$input" "$delimiter" "$key_collumns")
  first_key_collumn=$(echo "$key_collumns" | cut -d"," -f1 )
  
  for (( i=1; i<first_key_collumn; i++))
  do
	printf "%s" "$delimiter"
  done
  
  printf "%s" "$delimiter"
  
  while IFS= read -r key_mapping ; do
    key=$(echo "$key_mapping" | cut -d" " -f1 | sed "s/$delimiter/_/g")
    printf "%s%s" "${delimiter}${key}"
  done <<< "$mapping"
}

table_shift::shift_collumns() {
  local input="$1"
  local delimiter="$2"
  local key_collumns="$3"
  mapping=$(table_shift::generate_mapping "$input" "$delimiter" "$key_collumns")

  echo "$input" | sed -f <(echo "$mapping" | sed 's/=> //;s# #/#;s#$#/#;s#^#s/#')
}

table_shift::transpose() {
  local input="$1"
  local delimiter="$2"
  local key_collumns="$3"
  header=$(table_shift::generate_header "$input" "$delimiter" "$key_collumns")
  shifted=$(table_shift::shift_collumns "$input" "$delimiter" "$key_collumns")
  echo "$header"
  echo "$shifted"
}



# ######################################################################



