#!/bin/bash

DIST_NAME="$1"
OREPAN_PATH="$2"

FILE=$(find . -maxdepth 1 -name "$DIST_NAME-*.tar.gz" | sed -e 's/^\.\///' | sort -r | head -n1)
VERSION=$(echo "$FILE" | perl -ne 'm/([v0-9_\.]+)\./; print $1')

if [ -e $FILE ] && [ -n $VERSION ]; then \
    [ -z $(find $OREPAN_PATH -name "$FILE") ] \
        && orepan2-inject $FILE $OREPAN_PATH \
    && cd $OREPAN_PATH \
        && git add . \
        && git commit -m "Add $DIST_NAME version $VERSION" \
        && git push origin master \
    && cd ../ \
        && git add . \
        && git commit -m "Bump version to $VERSION" \
        && git push origin master \
        && git tag $VERSION \
        && git push origin $VERSION
fi
