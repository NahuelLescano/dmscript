#!/usr/bin/env bash

DMENU="rofi -show-icons -dmenu -i -p"
PDF_VIEWER="zathura"

main() {
    files="$(find "$HOME" -maxdepth 4 -iname "*.pdf")"
    choice=$(printf '%s\n' "${files[@]}" \
        | cut -d '/' -f4- \
        | sed -e 's/Documents/Dcs/g' \
            -e 's/Pictures/Pic/g' \
            -e 's/Images/Img/g' \
            -e 's/.pdf//g' \
        | sort -g \
        | ${DMENU} "File: ") || exit 1
    if [ "$choice" ]; then
        file=$(
            printf '%s' "$choice" \
                | sed -e 's/Dcs/Documents/g' \
                    -e 's/Pic/Pictures/g' \
                    -e 's/Img/Images/g'
        )
        "${PDF_VIEWER}" "$HOME/${file}.pdf"
    else
        echo "Program Terminated." && exit 0
    fi
}

main
