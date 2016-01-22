#!/bin/bash
VERSION=`head -1 VERSION.txt`
RELEASE_DIR="Releases-$VERSION"
mkdir -p $RELEASE_DIR
echo "Generating FH iOS SDK GitHub Releases"
echo "Generating fh-framework-$VERSION.zip"
pod package FH.podspec
zip -9ry "./$RELEASE_DIR/fh-framework-$VERSION.zip" "./FH-$VERSION/ios/FH.framework"
echo "Done"

echo "Releases files are generated. Please upload them to GitHub".