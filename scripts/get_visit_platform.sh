#!/bin/bash

path=$(dirname $0)

. "$path"/visit/bv_visit.sh
. "$path"/visit/bv_main.sh

initialize_build_visit &>/dev/null

printf $VISITARCHTMP
