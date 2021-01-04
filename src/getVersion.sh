#!/bin/sh
FULLTAG=$(git describe --tags)
REGEX="v([0-9]+)\.([0-9]+)\.([0-9]+)-([0-9]+)-([a-zA-Z0-9]+)"
git describe --tags
if $FULLTAG =~ $REGEX; then
    MAJORVERSION="${BASH_REMATCH[1]}"
    MINORVERSION="${BASH_REMATCH[2]}"
    PATCHNUMBER="${BASH_REMATCH[3]}"
    BUILDNUMBER="${BASH_REMATCH[4]}"
    UNIQUEIDENTIFYER="${BASH_REMATCH[5]}"
    VERSION="${MAJORVERSION}.${MINORVERSION}.${PATCHNUMBER}"
    FULLVERSION="${VERSION}.${BUILDNUMBER}"
    echo "::set-output name=major-version::${MAJORVERSION}"
    echo "::set-output name=minor-version::${MINORVERSION}"
    echo "::set-output name=patch-number::${PATCHNUMBER}"
    echo "::set-output name=build-number::${BUILDNUMBER}"
    echo "::set-output name=version::${VERSION}"
    echo "::set-output name=full-version::${FULLVERSION}"
    echo "::set-output name=full-tag::${FULLTAG}"
    echo "::set-output name=unique-identifyer::${UNIQUEIDENTIFYER}"
fi
