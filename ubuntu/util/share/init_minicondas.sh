#!/usr/bin/env bash

DOWNLOAD_MIRROR=$1

. $SCRIPT_UTIL_SHARE/init_miniconda3.sh $DOWNLOAD_MIRROR
. $SCRIPT_UTIL_SHARE/init_miniconda2.sh $DOWNLOAD_MIRROR

. $SCRIPT_UTIL_SHARE/init_hatch.sh
