#!/bin/bash

add() {
  echo $(($1 + $2))
}


if [ "${BASH_SOURCE[0]}" = "$0" ]; then add "${1:-0}" "${2:-0}"; fi

