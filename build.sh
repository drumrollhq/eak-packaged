#!/bin/sh
set -e
set -x

git submodule update --init --recursive

cd eak
VERSION=$(git describe --always --tags --abbrev=0)
npm install
bower install
./node_modules/.bin/gulp build -o

cd ../
rm -rf .build
mkdir .build
cp -r eak/public/ .build/app
cp -r ./main.js ./package.json ./node_modules .build

rm -rf dist
mkdir dist

./node_modules/.bin/electron-packager ./.build 'E.A.K' \
  --platform=darwin --arch=x64 --version=0.28.1 --asar --out=dist/osx --app-version=$VERSION --icon=icon.icns
./node_modules/.bin/electron-packager ./.build 'E.A.K' \
  --platform=win32 --arch=x64 --version=0.28.1 --asar --out=dist/win-64 --app-version=$VERSION --icon=icon.ico
./node_modules/.bin/electron-packager ./.build 'E.A.K' \
  --platform=win32 --arch=ia32 --version=0.28.1 --asar --out=dist/win-32 --app-version=$VERSION --icon=icon.ico

rm -rf .build

cd dist/osx
zip -r E.A.K-osx.zip ./
cd ../win-64
mv E.A.K-win32 E.A.K
zip -r E.A.K-win-64.zip ./
cd ../win-32
mv E.A.K-win32 E.A.K
zip -r E.A.K-win-32.zip ./

cd ../
mv */E.A.K-*.zip ./
