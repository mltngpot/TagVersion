#!/bin/sh
FullTag=$(git describe --tags)
MajorVersion=$(echo $FullTag | grep -oP "v\K([0-9]+)(?=\.([0-9]+)\.([0-9]+))")
MinorVersion=$(echo $FullTag | grep -oP "v([0-9]+)\.\K([0-9]+)(?=\.([0-9]+))")
PatchNumber=$(echo $FullTag | grep -oP "v([0-9]+)\.([0-9]+)\.\K([0-9]+)")
Version="${MajorVersion}.${MinorVersion}.${PatchNumber}"
FullVersion="${Version}.0"
echo "Major Version == ${MajorVersion}"
echo "::set-output name=major-version::${MajorVersion}"
echo "Minor Version == ${MinorVersion}"
echo "::set-output name=minor-version::${MinorVersion}"
echo "Patch Number == ${PatchNumber}"
echo "::set-output name=patch-number::${PatchNumber}"
echo "::set-output name=build-number::0"
echo "Version == ${Version}"
echo "::set-output name=version::${Version}"
echo "Full Version == ${FullVersion}"
echo "::set-output name=full-version::${FullVersion}"
echo "Full Tag == ${FullTag}"
echo "::set-output name=full-tag::${FullTag}"
