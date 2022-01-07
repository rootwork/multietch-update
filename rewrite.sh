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
find . -regex ".*\.\(html\|css\|js\)$" -type f -print0 | xargs -0 sed -i 's;/files/assets/files;/files/assets;g'

# Removing Typekit and loading local fonts
find . -name "*.html" -type f -print0 | xargs -0 sed -i 's;<script type="text/javascript" src="https://use.typekit.net/ik/d5_k-xXoeCy2ZHoc7fFRMiWtFOwVDV3XBgJgSyQAXoMfeCwIfFHN4UJLFRbh52jhWDmRwQiqFQsyZeI3wc4R5QSXwAFqZcmcFy79MkG0jAFu-WsoShFGZAsude80ZkoRdhXCHKoyjamTiY8Djhy8ZYmC-Ao1Oco8if37OcBDOcu8OfG0SaBujW48SagyjhmDjhy8ZYmC-Ao1OcFzdP37O1sziAFydKu3ZAoXjAizdKuX52FRO1FUiABkZWF3jAF8OcFzdPUyjamTiY8Djhy8ZYmC-Ao1OcFzdPUyjamTiY8Djhy8ZYmC-Ao1Oco8ifUySkolZPUCdhFydeyzSabCdWmCie88ieFGOcFzdPUDSWmyScmDSeBRZWFR-emqiAUTdcS0jhNlOYsziAFydKu3ZAoXjAizdKuX52FRO1FUiABkZWF3jAF8OcFzdPUaiaS0jAFu-WsoShFGZAsude80ZkoRdhXCiaiaOcBRiA8XpWFR-emqiAUTdcS0dcmXOYiaikoySkolZPUaiaS0dWmCie88ieFGOcFzdPUaiaS0SaBujW48SagyjhmDjhy8ZYmC-Ao1OcFzdPUaiaS0ieNujhB0OWg8d1syZhN0OWbtwhw0SaBujW48Sagyjh90jhNlJygcScmTZhyXOWFyd1wlSY4zH6qJqeqbMg62JMJ7fbRHmsMMeMb6MKG4f44TIMMjgPMfH6qJ8eqbMg6eJMJ7fbK5-sMMeMS6MKG4f4BTIMMj2PMfH6qJRAqbMg65JMJ7fbKQ-sMMeMv6MKG4f4mTIMMjIfMfH6qJRhqbMg6sJMHbM-h-7VCB.js"></script>;;g'
find . -name "*.html" -type f -print0 | xargs -0 sed -i 's;<script type="text/javascript" src="/https://use.typekit.net/ik/d5_k-xXoeCy2ZHoc7fFRMiWtFOwVDV3XBgJgSyQAXoMfeCwIfFHN4UJLFRbh52jhWDmRwQiqFQsyZeI3wc4R5QSXwAFqZcmcFy79MkG0jAFu-WsoShFGZAsude80ZkoRdhXCHKoyjamTiY8Djhy8ZYmC-Ao1Oco8if37OcBDOcu8OfG0SaBujW48SagyjhmDjhy8ZYmC-Ao1OcFzdP37O1sziAFydKu3ZAoXjAizdKuX52FRO1FUiABkZWF3jAF8OcFzdPUyjamTiY8Djhy8ZYmC-Ao1OcFzdPUyjamTiY8Djhy8ZYmC-Ao1Oco8ifUySkolZPUCdhFydeyzSabCdWmCie88ieFGOcFzdPUDSWmyScmDSeBRZWFR-emqiAUTdcS0jhNlOYsziAFydKu3ZAoXjAizdKuX52FRO1FUiABkZWF3jAF8OcFzdPUaiaS0jAFu-WsoShFGZAsude80ZkoRdhXCiaiaOcBRiA8XpWFR-emqiAUTdcS0dcmXOYiaikoySkolZPUaiaS0dWmCie88ieFGOcFzdPUaiaS0SaBujW48SagyjhmDjhy8ZYmC-Ao1OcFzdPUaiaS0ieNujhB0OWg8d1syZhN0OWbtwhw0SaBujW48Sagyjh90jhNlJygcScmTZhyXOWFyd1wlSY4zH6qJqeqbMg62JMJ7fbRHmsMMeMb6MKG4f44TIMMjgPMfH6qJ8eqbMg6eJMJ7fbK5-sMMeMS6MKG4f4BTIMMj2PMfH6qJRAqbMg65JMJ7fbKQ-sMMeMv6MKG4f4mTIMMjIfMfH6qJRhqbMg6sJMHbM-h-7VCB.js"></script>;;g'
find . -name "*.html" -type f -print0 | xargs -0 sed -i 's;<script type="text/javascript" src="/use.typekit.net/ik/d5_k-xXoeCy2ZHoc7fFRMiWtFOwVDV3XBgJgSyQAXoMfeCwIfFHN4UJLFRbh52jhWDmRwQiqFQsyZeI3wc4R5QSXwAFqZcmcFy79MkG0jAFu-WsoShFGZAsude80ZkoRdhXCHKoyjamTiY8Djhy8ZYmC-Ao1Oco8if37OcBDOcu8OfG0SaBujW48SagyjhmDjhy8ZYmC-Ao1OcFzdP37O1sziAFydKu3ZAoXjAizdKuX52FRO1FUiABkZWF3jAF8OcFzdPUyjamTiY8Djhy8ZYmC-Ao1OcFzdPUyjamTiY8Djhy8ZYmC-Ao1Oco8ifUySkolZPUCdhFydeyzSabCdWmCie88ieFGOcFzdPUDSWmyScmDSeBRZWFR-emqiAUTdcS0jhNlOYsziAFydKu3ZAoXjAizdKuX52FRO1FUiABkZWF3jAF8OcFzdPUaiaS0jAFu-WsoShFGZAsude80ZkoRdhXCiaiaOcBRiA8XpWFR-emqiAUTdcS0dcmXOYiaikoySkolZPUaiaS0dWmCie88ieFGOcFzdPUaiaS0SaBujW48SagyjhmDjhy8ZYmC-Ao1OcFzdPUaiaS0ieNujhB0OWg8d1syZhN0OWbtwhw0SaBujW48Sagyjh90jhNlJygcScmTZhyXOWFyd1wlSY4zH6qJqeqbMg62JMJ7fbRHmsMMeMb6MKG4f44TIMMjgPMfH6qJ8eqbMg6eJMJ7fbK5-sMMeMS6MKG4f4BTIMMj2PMfH6qJRAqbMg65JMJ7fbKQ-sMMeMv6MKG4f4mTIMMjIfMfH6qJRhqbMg6sJMHbM-h-7VCB.js"></script>;;g'

find . -name "*.css" -type f -print0 | xargs -0 sed -i 's#/\*\! Squarespace LESS Compiler  (less.js language v1.3.3)  \*/#@import "/files/manual/fonts/stylesheet.css";#g'

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
find . -regex ".*\.\(html\|css\|js\)$" -type f -print0 | xargs -0 sed -i 's;/files/content/v1/5c17d54ada02bc9741cdfef6/1601477178763-AP6A0LX8HXPT07G0EUC8/MEwebStripwwo%2B%282%29.jpg;/files/manual/MEwebStrip.jpg;g'

# Fixing Zoho embed
find . -name "*.html" -type f -print0 | xargs -0 sed -i 's;src="/https://crm.zohopublic.com;https://crm.zohopublic.com;g'

# Removing unnecessary components
find . -name "*.html" -type f -print0 | xargs -0 sed -i 's;<link rel="preconnect" href="/files/index.html">;;g'
find . -name "*.html" -type f -print0 | xargs -0 sed -i 's;<link rel="alternate" type="application/rss+xml" title="RSS Feed" href="https://www.multietch.com/home?format=rss" />;;g'
find . -name "*.html" -type f -print0 | xargs -0 sed -i 's;    <!-- This is Squarespace. --><!-- toucan-pentagon-t83c -->;;g'

# Fixing navigation menu links

find . -name "*.html" -type f -print0 | xargs -0 sed -i 's;"/about";"/about/history.html";g'
find . -name "*.html" -type f -print0 | xargs -0 sed -i 's;"/etch-rates-1";"/etch-rates.html";g'
