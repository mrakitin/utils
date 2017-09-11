#!/bin/bash

# Author : Maksim Rakitin
# Date   : 2016-08-09 (based on the script to change to a calc dir using SLURM from 2009-10-13)
# Version: 2.0
# Purpose: To navigate to calc directory directly by using find information
# Usage  : source qcd.sh k5N5vndz

LOCAL_RUN="$HOME/src/radiasoft/sirepo/run/"
LOCAL_RUN2="/vagrant/sirepo/run/"
GLOBAL_RUN="/var/db/sirepo/"

if [ -d "$LOCAL_RUN" ]; then
    run_dir=$LOCAL_RUN
elif [ -d "$LOCAL_RUN2" ]; then
    run_dir=$LOCAL_RUN2
elif [ -d "$GLOBAL_RUN" ]; then
    run_dir=$GLOBAL_RUN
else
    echo "Neither $LOCAL_RUN, nor $GLOBAL_RUN exist. Exit"
    # exit 1
fi

if [ ! -z "$1" ]; then
    calc_dir=$(find $run_dir -name $1)
    echo "--- Calc dir = $calc_dir"

    cd $calc_dir
else
    cd .
fi

