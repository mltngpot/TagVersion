#!/bin/sh
FullTag=$(git describe --tags)
MajorVersion=$(echo $FullTag | grep -oP "v\K([0-9]+)(?=\.([0-9]+)\.([0-9]+)-([0-9]+)-([a-zA-Z0-9]+))")
MinorVersion=$(echo $FullTag | grep -oP "v([0-9]+)\.\K([0-9]+)(?=\.([0-9]+)-([0-9]+)-([a-zA-Z0-9]+))")
PatchNumber=$(echo $FullTag | grep -oP "v([0-9]+)\.([0-9]+)\.\K([0-9]+)(?=-([0-9]+)-([a-zA-Z0-9]+))")
BuildNumber=$(echo $FullTag | grep -oP "v([0-9]+)\.([0-9]+)\.([0-9]+)-\K([0-9]+)(?=-([a-zA-Z0-9]+))")
UniqueIdentiyfer=$(echo $FullTag | grep -oP "v([0-9]+)\.([0-9]+)\.([0-9]+)-([0-9]+)-\K([a-zA-Z0-9]+)")
Version="${MajorVersion}.${MinorVersion}.${PatchNumber}"
FullVersion="${Version}.${BuildNumber}"
echo "::set-output name=major-version::${MajorVersion}"
echo "::set-output name=minor-version::${MinorVersion}"
echo "::set-output name=patch-number::${PatchNumber}"
echo "::set-output name=build-number::${BuildNumber}"
echo "::set-output name=version::${Version}"
echo "::set-output name=full-version::${FullVersion}"
echo "::set-output name=full-tag::${FullTag}"
echo "::set-output name=unique-identifyer::${UniqueIdentiyfer}"
