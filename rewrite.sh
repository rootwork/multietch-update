#!/usr/bin/env bash

set -e

# Restricting rewriting to versions in `docs` only
cd docs

# Changing references to subdomains
find . -regex ".*\.\(html\|css\|js\)$" -type f -print0 | xargs -0 sed -i 's;https://images.squarespace-cdn.com;/files;g'
find . -regex ".*\.\(html\|css\|js\)$" -type f -print0 | xargs -0 sed -i 's;http://static1.squarespace.com;/files;g'
find . -regex ".*\.\(html\|css\|js\)$" -type f -print0 | xargs -0 sed -i 's;https://static1.squarespace.com;/files;g'
find . -regex ".*\.\(html\|css\|js\)$" -type f -print0 | xargs -0 sed -i 's;https://assets.squarespace.com;/files/assets;g'

# Changing references to primary domain
find . -name "*.html" -type f -print0 | xargs -0 sed -i 's;href="https://www.multietch.com/;href="/;g'
find . -name "*.html" -type f -print0 | xargs -0 sed -i 's;href="https://www.multietch.com;href="/;g'

# Changing relative links to assets
find . -name "*.html" -type f -print0 | xargs -0 sed -i 's;\(href|src\)="[\.\./]*s;\1="/files/s;g'
find . -name "*.html" -type f -print0 | xargs -0 sed -i 's;\(href|src\)="[\.\./]*static1.squarespace.com;\1="/files;g'
find . -name "*.html" -type f -print0 | xargs -0 sed -i 's;\(href|src\)="[\.\./]*images.squarespace-cdn.com;\1="/files;g'
find . -name "*.html" -type f -print0 | xargs -0 sed -i 's;\(href|src\)="[\.\./]*assets.squarespace.com;\1="/files/assets;g'
find . -name "*.html" -type f -print0 | xargs -0 sed -i 's;\(href|src\)="[\.\./]*universal;\1="/files/universal;g'

# Changing specific links
find . -name "*.html" -type f -print0 | xargs -0 sed -i 's;href="index.html;href="/;g'
find . -name "*.html" -type f -print0 | xargs -0 sed -i 's;href="about;href="/about;g'
find . -name "*.html" -type f -print0 | xargs -0 sed -i 's;href="blog;href="/blog;g'

# Removing unnecessary components
find . -name "*.html" -type f -print0 | xargs -0 sed -i 's;<link rel="preconnect" href="/images.squarespace-cdn.com/index.html">;;g'
find . -name "*.html" -type f -print0 | xargs -0 sed -i 's;<link rel="alternate" type="application/rss+xml" title="RSS Feed" href="https://www.multietch.com/home?format=rss" />;;g'
find . -name "*.html" -type f -print0 | xargs -0 sed -i 's;    <!-- This is Squarespace. --><!-- toucan-pentagon-t83c -->;;g'
