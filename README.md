# eak-packaged
Scripts and icons for packaging E.A.K. with electron-shell

## To set up:
- `$ git clone git@github.com:drumrollhq/eak-packaged.git`
- `$ npm install`
- To produce Windows builds on OSX, we need something called `rcedit.exe`, which requires wine: `$ brew install wine`

## To build:
- `$ ./build.sh`
- This should make a folder `dist`, like so:
```
dist
├── E.A.K-osx.zip
├── E.A.K-win-32.zip
├── E.A.K-win-64.zip
├── osx-64
│   └── E.A.K.app
├── win-32
│   └── E.A.K/E.A.K.exe
└── win-64
    └── E.A.K/E.A.K.exe
```
