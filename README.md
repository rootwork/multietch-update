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
mv images.squarespace-cdn.com/* docs/files
mv static1.squarespace.com/* docs/files
mv assets.squarespace.com/* docs/files/assets
mv www.multietch.com/* docs
mv docs/s docs/files
rm -rf www.multietch.com && rm -rf images.squarespace-cdn.com && rm -rf static1.squarespace.com && rm -rf assets.squarespace.com
cd docs
find . -regex ".*\.\(html\|css\|js\)$" -type f -print0 | xargs -0 sed -i 's;https://images.squarespace-cdn.com/content;/files/content;g'
find . -regex ".*\.\(html\|css\|js\)$" -type f -print0 | xargs -0 sed -i 's;https://assets.squarespace.com;/files/assets;g'
find . -regex ".*\.\(html\|css\|js\)$" -type f -print0 | xargs -0 sed -i 's;http://static1.squarespace.com;/files;g'
find . -regex ".*\.\(html\|css\|js\)$" -type f -print0 | xargs -0 sed -i 's;https://static1.squarespace.com;/files;g'
find . -regex ".*\.\(html\|css\|js\)$" -type f -print0 | xargs -0 sed -i 's;href="https://www.multietch.com;href="/;g'
find . -regex ".*\.\(html\|css\|js\)$" -type f -print0 | xargs -0 sed -i 's;href="../s/;href="/files/s/;g'
find . -regex ".*\.\(html\|css\|js\)$" -type f -print0 | xargs -0 sed -i 's;href="index.html;href="/;g'
find . -regex ".*\.\(html\|css\|js\)$" -type f -print0 | xargs -0 sed -i 's;href="about;href="/about;g'
find . -regex ".*\.\(html\|css\|js\)$" -type f -print0 | xargs -0 sed -i 's;<link rel="preconnect" href="../images.squarespace-cdn.com/index.html">;;g'
find . -regex ".*\.\(html\|css\|js\)$" -type f -print0 | xargs -0 sed -i 's;<link rel="alternate" type="application/rss+xml" title="RSS Feed" href="https://www.multietch.com/home?format=rss" />;;g'
find . -regex ".*\.\(html\|css\|js\)$" -type f -print0 | xargs -0 sed -i 's;    <!-- This is Squarespace. --><!-- toucan-pentagon-t83c -->;;g'
```
