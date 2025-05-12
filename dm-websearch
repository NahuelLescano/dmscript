#! /usr/bin/env bash

declare -A websearch
# Search engine
websearch[brave]="https://search.brave.com/search?q="
websearch[duckduckgo]="https://duckduckgo.com/?q="
websearch[google]="https://www.google.com/search?q="
websearch[qwant]="https://www.qwant.com/?q="
# News / information
websearch[bbcnews]="https://www.bbc.co.uk/search?q="
websearch[cnn]="https://www.cnn.com/search?q="
websearch[googlenews]="https://news.google.com/search?q="
websearch[wikipedia]="https://en.wikipedia.org/w/index.php?search="
websearch[clarin]="https://www.clarin.com/buscador/?q="
websearch[infobae]="https://www.infobae.com/america/buscador/?query="
websearch[nytimes]="https://www.nytimes.com/search?query="
# Social media
websearch[youtube]="https://www.youtube.com/results?search_query="
websearch[odysee]="https://odysee.com/$/search?q="
# Online shopping
websearch[amazon]="https://www.amazon.com/s?k="
# Linux
websearch[arch pkg]="https://archlinux.org/packages/?q="
websearch[arch aur]="https://aur.archlinux.org/packages?O=0&K="
websearch[archwiki]="https://wiki.archlinux.org/index.php?search="
# Development
websearch[stackoverflow]="https://stackoverflow.com/search?q="
# Entertaiment
websearch[cinemark]="https://www.cinemarkhoyts.com.ar/pelicula/"

# dmenu prints the options in insensitive mode, 20 options and prompt it something.
dmenu="rofi -dmenu -i -p"

# Web browser
browser="brave"

main() {
    engine=$(printf '%s\n' "${!websearch[@]}" | sort | ${dmenu} 'Choose search engine:' "$@") || exit 1

    url="${websearch["${engine}"]}"

    query=$(printf '%s' "$engine" | ${dmenu} 'Enter search query:')

    query="$(echo -n "${query}" | jq -s -R -r @uri)"

    ${browser} "${url}${query}"
}

main
