$FullTag = git describe --tags
$MajorVersion = $FullTag -replace 'v(\d+)\.(\d+)\.(\d+)', '$1'
$MinorVersion = $FullTag -replace 'v(\d+)\.(\d+)\.(\d+)', '$2'
$PatchNumber = $FullTag -replace 'v(\d+)\.(\d+)\.(\d+)', '$3'
$Version = "$MajorVersion.$MinorVersion.$PatchNumber"
$FullVersion = "$Version.0"

Write-Output "Major Version == $MajorVersion"
Add-Content -Path $env:GITHUB_OUTPUT -Value "major-version=$MajorVersion"
Write-Output "Minor Version == $MinorVersion"
Add-Content -Path $env:GITHUB_OUTPUT -Value "minor-version=$MinorVersion"
Write-Output "Patch Number == $PatchNumber"
Add-Content -Path $env:GITHUB_OUTPUT -Value "patch-number=$PatchNumber"
Add-Content -Path $env:GITHUB_OUTPUT -Value "build-number=0"
Write-Output "Version == $Version"
Add-Content -Path $env:GITHUB_OUTPUT -Value "version=:${Version}"
Write-Output "Full Version == $FullVersion"
Add-Content -Path $env:GITHUB_OUTPUT -Value "full-version=$FullVersion"
Write-Output "Full Tag == $FullTag"
Add-Content -Path $env:GITHUB_OUTPUT -Value "full-tag=$FullTag"