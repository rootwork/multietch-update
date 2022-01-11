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

* Open the deeply-nested `site.css` file and add the following to the top:
```css
@import "/files/manual/fonts/stylesheet.css";
@import "/files/manual/additions.css";
```
* `about/testimonials.html`: replace `<p class="entry-more-link">.*</p>` with nothing
* `multietch-blog.html`: replace `"baseUrl":"https://www.multietch.com"` with `"baseUrl":"/"`

Run [Linkchecker](https://linkchecker.github.io/linkchecker/index.html) from the command line, on a local or hosted version of the exported site, to determine broken links. Commands:

```sh
linkchecker --no-robots -F html --ignore-url='/tag' --ignore-url='/category' <siteurl>`
```

```sh
linkchecker --no-robots -F csv --ignore-url='/tag' --ignore-url='/category' <siteurl>`
```

The latter of these was used to create `brokenlinks.csv` which can be used to manually, tediously, update broken images. (Be sure to do a search/find for all instances of the broken image, not only the instance it found, as it can overlook things like meta tags or JS files.)

## Post-export fixes

* Any embedded videos that were using custom image overlays in Squarespace need to be re-embedded directly. We could use other (non-SS) libraries in the future to have custom image overlays again, but we don't need that right away.

* Slideshows don't show controls consistently and were always substandard anyway, so they need to be fully replaced.

* Contact forms (contact page and "keeping etch times consistent" page) need to be replaced with a non-SS option.
