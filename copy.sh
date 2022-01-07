#!/usr/bin/env bash

set -e
cp -r images.squarespace-cdn.com/* docs/files
cp -r static1.squarespace.com/* docs/files
cp -r assets.squarespace.com/* docs/files/assets
cp -r www.multietch.com/* docs
mv docs/s docs/files
