# multietch

Squarespace export

## (Re)running the export

We run `mirror.sh` **three times** because Squarespace is finicky and tries to deny access randomly. `wget` will ignore files that have already been retrieved in the subsequent rounds.

One quick way to check if all files are there is to look at the `etching-` files; there should be 23. A complete list of all files (excluding third-party domain page assets) can be found on the [sitemap](https://www.multietch.com/sitemap.xml).

```sh
rm -rf docs && mkdir docs && mkdir docs/files && mkdir docs/files/assets
./mirror.sh
./mirror.sh
./mirror.sh
cp -r images.squarespace-cdn.com/* docs/files
cp -r static1.squarespace.com/* docs/files
cp -r assets.squarespace.com/* docs/files/assets
cp -r www.multietch.com/* docs
mv docs/s docs/files
cd docs
find . -regex ".*\.\(html\|css\|js\)$" -type f -print0 | xargs -0 sed -i 's;https://images.squarespace-cdn.com/content;/files/content;g'
find . -regex ".*\.\(html\|css\|js\)$" -type f -print0 | xargs -0 sed -i 's;https://assets.squarespace.com;/files/assets;g'
find . -regex ".*\.\(html\|css\|js\)$" -type f -print0 | xargs -0 sed -i 's;http://static1.squarespace.com;/files;g'
find . -regex ".*\.\(html\|css\|js\)$" -type f -print0 | xargs -0 sed -i 's;https://static1.squarespace.com;/files;g'
find . -name "*.html" -type f -print0 | xargs -0 sed -i 's;href="https://www.multietch.com;href="/;g'
find . -name "*.html" -type f -print0 | xargs -0 sed -i 's;href="../s/;href="/files/s/;g'
find . -name "*.html" -type f -print0 | xargs -0 sed -i 's;href="index.html;href="/;g'
find . -name "*.html" -type f -print0 | xargs -0 sed -i 's;href="about;href="/about;g'
find . -name "*.html" -type f -print0 | xargs -0 sed -i 's;<link rel="preconnect" href="../images.squarespace-cdn.com/index.html">;;g'
find . -name "*.html" -type f -print0 | xargs -0 sed -i 's;<link rel="alternate" type="application/rss+xml" title="RSS Feed" href="https://www.multietch.com/home?format=rss" />;;g'
find . -name "*.html" -type f -print0 | xargs -0 sed -i 's;    <!-- This is Squarespace. --><!-- toucan-pentagon-t83c -->;;g'
```
