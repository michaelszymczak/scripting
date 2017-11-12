#!/bin/bash
set -euo pipefail
IFS=$'\n\t'

. ./add.sh
. ./common.sh

function createTmpDir {
    mktemp -d -t tmp.XXXXXXXXXX
}

readonly TMPDIR=$(createTmpDir)
function cleanup {
  rm -rf "$TMPDIR"
}
trap cleanup EXIT


# ######################################################################

info A
warn B
error C
fatal D

echo "@@"

