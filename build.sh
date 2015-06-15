#!/bin/sh
set -e
set -x

git submodule update --init --recursive
cd eak
npm install
bower install
./node_modules/.bin/gulp build -o
cd ../
cp -r eak/public/ app
