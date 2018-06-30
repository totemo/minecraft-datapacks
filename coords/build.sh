#!/bin/bash

HERE=$(cd $(dirname "$0") && pwd)
PACKAGE=$(basename "$HERE")
DIST="$HERE/dist"
ARCHIVE="$DIST/$PACKAGE.zip"

mkdir -p "$DIST"
rm -f "$ARCHIVE"
cd "$HERE/src/" && zip -r "$ARCHIVE" .

echo "Created $ARCHIVE"
