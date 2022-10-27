#!/bin/sh
FullTag=$(git describe --tags)
MajorVersion=$(echo $FullTag | grep -oP "v\K([0-9]+)(?=\.([0-9]+)\.([0-9]+))")
MinorVersion=$(echo $FullTag | grep -oP "v([0-9]+)\.\K([0-9]+)(?=\.([0-9]+))")
PatchNumber=$(echo $FullTag | grep -oP "v([0-9]+)\.([0-9]+)\.\K([0-9]+)")
Version="${MajorVersion}.${MinorVersion}.${PatchNumber}"
FullVersion="${Version}.0"
echo "Major Version == ${MajorVersion}"
echo "major-version=${MajorVersion}" >> $GITHUB_OUTPUT
echo "Minor Version == ${MinorVersion}"
echo "minor-version=${MinorVersion}" >> $GITHUB_OUTPUT
echo "Patch Number == ${PatchNumber}"
echo "patch-number=${PatchNumber}" >> $GITHUB_OUTPUT
echo "build-number=0" >> $GITHUB_OUTPUT
echo "Version == ${Version}"
echo "version=:${Version}" >> $GITHUB_OUTPUT
echo "Full Version == ${FullVersion}"
echo "full-version=${FullVersion}" >> $GITHUB_OUTPUT
echo "Full Tag == ${FullTag}"
echo "full-tag=${FullTag}" >> $GITHUB_OUTPUT
