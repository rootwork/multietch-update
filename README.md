# multietch

Squarespace export

## (Re)running the export

```sh
./mirror.sh
rm -rf docs && mkdir docs
mkdir docs/files
mv images.squarespace-cdn.com/* docs/files
mv static1.squarespace.com/* docs/files
mv assets.squarespace.com/* docs/files/assets
mv www.multietch.com/* docs
rm -rf www.multietch.com && rm -rf images.squarespace-cdn.com && rm -rf static1.squarespace.com
cd docs
find . -name "*.html" -type f -print0 | xargs -0 sed -i 's;https://images.squarespace-cdn.com/content;/files/content;g'
find . -name "*.html" -type f -print0 | xargs -0 sed -i 's;https://assets.squarespace.com;/files/assets;g'
find . -name "*.html" -type f -print0 | xargs -0 sed -i 's;http://static1.squarespace.com;/files;g'
find . -name "*.html" -type f -print0 | xargs -0 sed -i 's;https://static1.squarespace.com;/files;g'
find . -name "*.html" -type f -print0 | xargs -0 sed -i 's;href="https://www.multietch.com;href="/;g'
find . -name "*.html" -type f -print0 | xargs -0 sed -i 's;href="index.html;href="/;g'
find . -name "*.html" -type f -print0 | xargs -0 sed -i 's;href="about;href="/about;g'
find . -name "*.html" -type f -print0 | xargs -0 sed -i 's;<link rel="preconnect" href="../images.squarespace-cdn.com/index.html">;;g'
find . -name "*.html" -type f -print0 | xargs -0 sed -i 's;<link rel="alternate" type="application/rss+xml" title="RSS Feed" href="https://www.multietch.com/home?format=rss" />;;g'
```
