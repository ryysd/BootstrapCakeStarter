#!/bin/sh
if [ $# -ne 1 ]; then
    echo "usage: "
    echo "./setupsh path_to_approot_from_documentroot"
    exit 1
fi

git submodule init
git submodule update
git submodule foreach 'git pull origin master' or git submodule foreach 'git checkout master; git pull'

sed -i -e s/path_to_approot_from_documentroot/$1/ .htaccess

mkdir -p ./app/tmp/models
mkdir -p ./app/tmp/view
mkdir -p ./app/tmp/persistent
mkdir -p ./app/tmp/log

chmod -R 707 ./app/tmp

vim app/Config/database.php
