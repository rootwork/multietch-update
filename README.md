# multietch

Squarespace export

## (Re)running the export

We run `mirror.sh` **three times** because Squarespace is finicky and tries to deny access randomly. `wget` will ignore files that have already been retrieved in the subsequent rounds.

One quick way to check if all files are there is to look at the `etching-` files; there should be 23. A complete list of all files (excluding third-party domain page assets) can be found on the [sitemap](https://www.multietch.com/sitemap.xml).

```sh
rm -rf docs && mkdir docs && mkdir docs/files && mkdir docs/files/assets
./mirror.sh && ./mirror.sh && ./mirror.sh
./copy.sh
```

### Mass-file updates

My regexfu failed me when combined with capture groups and `sed` and its many (nonstandard) (annoying) idiosyncrases. So then we need to do manual find and replace across the 'docs' files in Sublime Text (with regex enabled):

<table>
  <tr>
    <th>From</th>
    <th>To</th>
  </tr>
  <tr>
    <td>(href|src)="[\.\.\/]*s\/</td>
    <td>$1="\/files\/s\/</td>
  </tr>
  <tr>
    <td>(href|src)="[\.\.\/]*static1.squarespace.com</td>
    <td>$1="\/files</td>
  </tr>
  <tr>
    <td>(href|src)="[\.\.\/]*images.squarespace-cdn.com</td>
    <td>$1="\/files</td>
  </tr>
  <tr>
    <td>(href|src)="[\.\.\/]*assets.squarespace.com</td>
    <td>$1="\/files\/assets</td>
  </tr>
  <tr>
    <td>[\.\.\/]+universal</td>
    <td>\/files\/universal</td>
  </tr>
  <tr>
    <td>(href|src)="[\/]*[\.\.\/]*</td>
    <td>$1="\/</td>
  </tr>
</table>

Then for the simpler rewrites, run:

```sh
./rewrite.sh
```

### Manual page updates

A few pages benefit from specific fixes that we were never able to do within Squarespace. Using Sublime Text (with regex enabled), find and replace in these files:

* `about/testimonials.html`: replace `<p class="entry-more-link">.*</p>` with nothing
* `multietch-blog.html`: replace `"baseUrl":"https://www.multietch.com"` with `"baseUrl":"/"`

Finally, tediously, use `brokenlinks.csv` to manually update some of the image links.
