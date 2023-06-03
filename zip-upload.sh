#!/bin/bash

zip_file="mikochi-linux-$(dpkg --print-architecture).zip"
github_repo="zer0tonin/mikochi"

apt-get update
apt-get install -y zip
apt-get install -y curl
apt-get install -y jq

zip -r "$zip_file" static mikochi

upload_url=$(curl -X GET -H "Authorization: token $GITHUB_TOKEN" "https://api.github.com/repos/$github_repo/releases/$RELEASE" | jq -r '.upload_url')

upload_url="${upload_url%\{*}"
echo "Upload URL: $upload_url"

curl -X POST \
  -H "Authorization: token $GITHUB_TOKEN" \
  -H "Content-Type: application/zip" \
  --data-binary @"$zip_file" \
  "$upload_url?name=$zip_file"
