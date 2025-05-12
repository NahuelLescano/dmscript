#!/usr/bin/env bash

# You'll need arch-wiki-docs installed to work
wikiDir="/usr/share/doc/arch-wiki/html/en/"
if [ ! -d "$wikiDir" ]; then
    echo "Error: asegúrate de tener instalado el paquete 'arch-wiki-docs' y que esté en esta ubicación." >&2
    exit 1
fi

wikiDocs="$(find ${wikiDir} -iname "*.html")"

browser="brave"

dmenu="rofi -dmenu -i -p"

main() {
    choice=$(printf '%s\n' "${wikiDocs[@]}" | \
        cut -d '/' -f8- | \
        sed -e 's/_/ /g' -e 's/.html//g' | \
        sort -g | \
        ${dmenu} 'Arch wiki docs:') || exit 1

    if [ "${choice}" ]; then
        article=$(printf '%s\n' "${wikiDir}${choice}.html" | sed 's/ /_/g')
        "$browser" "$article"

    else
        echo "Program terminated." && exit 0
    fi
}

main
