#!/usr/bin/env bash

set -e
cd docs
find . -regex ".*\.\(html\|css\|js\)$" -type f -print0 | xargs -0 sed -i 's;https://images.squarespace-cdn.com/content;/files/content;g'
find . -regex ".*\.\(html\|css\|js\)$" -type f -print0 | xargs -0 sed -i 's;https://assets.squarespace.com;/files/assets;g'
find . -regex ".*\.\(html\|css\|js\)$" -type f -print0 | xargs -0 sed -i 's;http://static1.squarespace.com;/files;g'
find . -regex ".*\.\(html\|css\|js\)$" -type f -print0 | xargs -0 sed -i 's;https://static1.squarespace.com;/files;g'
find . -name "*.html" -type f -print0 | xargs -0 sed -i 's;href="https://www.multietch.com/;href="/;g'
find . -name "*.html" -type f -print0 | xargs -0 sed -i 's;href="https://www.multietch.com;href="/;g'
find . -name "*.html" -type f -print0 | xargs -0 sed -i 's;href="../s/;href="/files/s/;g'
find . -name "*.html" -type f -print0 | xargs -0 sed -i 's;href="../static1.squarespace.com;href="/files;g'
find . -name "*.html" -type f -print0 | xargs -0 sed -i 's;src="../static1.squarespace.com;src="/files;g'
find . -name "*.html" -type f -print0 | xargs -0 sed -i 's;src="../assets.squarespace.com;src="/files/assets;g'
find . -name "*.html" -type f -print0 | xargs -0 sed -i 's;src="../images.squarespace-cdn.com;src="/files;g'
find . -name "*.html" -type f -print0 | xargs -0 sed -i 's;href="index.html;href="/;g'
find . -name "*.html" -type f -print0 | xargs -0 sed -i 's;href="about;href="/about;g'
find . -name "*.html" -type f -print0 | xargs -0 sed -i 's;../;/;g'
find . -name "*.css" -type f -print0 | xargs -0 sed -i 's;../../../../../../../../universal;/files/universal;g'
find . -name "*.html" -type f -print0 | xargs -0 sed -i 's;<link rel="preconnect" href="/images.squarespace-cdn.com/index.html">;;g'
find . -name "*.html" -type f -print0 | xargs -0 sed -i 's;<link rel="alternate" type="application/rss+xml" title="RSS Feed" href="https://www.multietch.com/home?format=rss" />;;g'
find . -name "*.html" -type f -print0 | xargs -0 sed -i 's;    <!-- This is Squarespace. --><!-- toucan-pentagon-t83c -->;;g'
