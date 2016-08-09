#!/bin/bash

# Author : Maksim Rakitin
# Date   : 2016-08-09 (based on the script to change to a calc dir using SLURM from 2009-10-13)
# Version: 2.0
# Purpose: To navigate to calc directory directly by using find information
# Usage  : source qcd.sh k5N5vndz

if [ ! -z "$1" ]; then
    calc_dir=$(find ~/src/radiasoft/sirepo/run/ -name $1)
    echo "--- Calc dir = $calc_dir"

    cd $calc_dir
else
    cd .
fi

