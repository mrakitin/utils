#!/bin/bash

idir=$PWD
srw_python_dir="$HOME/src/radiasoft/SRW-light/env/work/srw_python"

cd $srw_python_dir

for i in $(ls -1 srw* uti* | grep -v '.pyd' | grep -v '.pyc'); do
    echo $i; ln -sv $PWD/${i} ~/.pyenv/versions/2.7.10/lib/python2.7/site-packages/${i}
done

cd $idir

