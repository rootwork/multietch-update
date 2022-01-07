#!/usr/bin/env bash

set -e

# Restricting rewriting to versions in `docs` only
cd docs

# Changing references to subdomains
find . -regex ".*\.\(html\|css\|js\)$" -type f -print0 | xargs -0 sed -i 's;https://images.squarespace-cdn.com;/files;g'
find . -regex ".*\.\(html\|css\|js\)$" -type f -print0 | xargs -0 sed -i 's;http://static1.squarespace.com;/files;g'
find . -regex ".*\.\(html\|css\|js\)$" -type f -print0 | xargs -0 sed -i 's;https://static1.squarespace.com;/files;g'
find . -regex ".*\.\(html\|css\|js\)$" -type f -print0 | xargs -0 sed -i 's;https://assets.squarespace.com;/files/assets;g'
find . -regex ".*\.\(html\|css\|js\)$" -type f -print0 | xargs -0 sed -i 's;https://www.multietch.com/images.squarespace-cdn.com;/files;g'
find . -regex ".*\.\(html\|css\|js\)$" -type f -print0 | xargs -0 sed -i 's;https://www.multietch.com/static1.squarespace.com;/files;g'
find . -regex ".*\.\(html\|css\|js\)$" -type f -print0 | xargs -0 sed -i 's;https://www.multietch.com/assets.squarespace.com;/files/assets;g'
find . -regex ".*\.\(html\|css\|js\)$" -type f -print0 | xargs -0 sed -i 's;"//assets.squarespace.com/files;"/files/assets;g'
find . -regex ".*\.\(html\|css\|js\)$" -type f -print0 | xargs -0 sed -i 's;"//files;"/files;g'
find . -regex ".*\.\(html\|css\|js\)$" -type f -print0 | xargs -0 sed -i 's;/images.squarespace-cdn.com;/files;g'
find . -regex ".*\.\(html\|css\|js\)$" -type f -print0 | xargs -0 sed -i 's;/static1.squarespace.com;/files;g'
find . -regex ".*\.\(html\|css\|js\)$" -type f -print0 | xargs -0 sed -i 's;/assets.squarespace.com;/files/assets;g'

# Fixing third-party embeds
find . -regex ".*\.\(html\|css\|js\)$" -type f -print0 | xargs -0 sed -i 's;src="/https://use.typekit.net;src="https://use.typekit.net;g'
find . -regex ".*\.\(html\|css\|js\)$" -type f -print0 | xargs -0 sed -i 's;src="/use.typekit.net;src="https://use.typekit.net;g'
find . -regex ".*\.\(html\|css\|js\)$" -type f -print0 | xargs -0 sed -i 's;/files/assets/files;/files/assets;g'
find . -regex ".*\.\(html\|css\|js\)$" -type f -print0 | xargs -0 sed -i 's;src="/https://crm.zohopublic.com;https://crm.zohopublic.com;g'

# Changing references to primary domain
find . -name "*.html" -type f -print0 | xargs -0 sed -i 's;href="https://www.multietch.com/;href="/;g'
find . -name "*.html" -type f -print0 | xargs -0 sed -i 's;href="https://www.multietch.com;href="/;g'

# Changing specific links
find . -name "*.html" -type f -print0 | xargs -0 sed -i 's;href="/index.html;href="/;g'
find . -name "*.html" -type f -print0 | xargs -0 sed -i 's;href="about;href="/about;g'
find . -name "*.html" -type f -print0 | xargs -0 sed -i 's;href="blog;href="/blog;g'

# Fixing specific files
find . -regex ".*\.\(html\|css\|js\)$" -type f -print0 | xargs -0 sed -i 's;/files/static/5c17d54ada02bc9741cdfef6/t/5ce56011de1c3c0001af3c72/1558536211042/MultiEtchLogo.png?format=1500w;/files/manual/MultiEtchLogo.png;g'
find . -regex ".*\.\(html\|css\|js\)$" -type f -print0 | xargs -0 sed -i 's;//files/content/v1/5c17d54ada02bc9741cdfef6/1558536209828-UW6CNJOOOVI7IWQCKFPT/MultiEtchLogo.png;/files/manual/MultiEtchLogo.png;g'
find . -regex ".*\.\(html\|css\|js\)$" -type f -print0 | xargs -0 sed -i 's;/files/content/v1/5c17d54ada02bc9741cdfef6/1558536209828-UW6CNJOOOVI7IWQCKFPT/MultiEtchLogo.png?format=1500w;/files/manual/MultiEtchLogo.png;g'

# Removing unnecessary components
find . -name "*.html" -type f -print0 | xargs -0 sed -i 's;<link rel="preconnect" href="/files/index.html">;;g'
find . -name "*.html" -type f -print0 | xargs -0 sed -i 's;<link rel="alternate" type="application/rss+xml" title="RSS Feed" href="https://www.multietch.com/home?format=rss" />;;g'
find . -name "*.html" -type f -print0 | xargs -0 sed -i 's;    <!-- This is Squarespace. --><!-- toucan-pentagon-t83c -->;;g'
