#!/bin/bash
. ./add.sh
##############################

test_should_add_two_numbers() {
  assertEquals "12" "$(add 5 7)"
}

. shunit2

