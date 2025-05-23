#!/usr/bin/env bash

## no cualquier tipo de radio puede ser reproducida directamente por mpv
## stream directo -> https://tunein.com/radio/home/

declare -A radio_stations
radio_stations[Aspen]="https://tunein.com/radio/Aspen-1023-(Buenos-Aires)-s25905/"
radio_stations[LaNacion]="https://masmusica.lanacion.com.ar/"
radio_stations[La100]="https://tunein.com/radio/La-100-999-s6984/"
radio_stations[Top-40]="https://tunein.com/radio/1FM-Top-40-s48967/"

dmenu="rofi -dmenu -i -p"
RADIO_VOLUME="70"

menu() {
    printf '%s\n' "Quit"
    printf '%s\n' "${!radio_stations[@]}" | sort
}

start_radio() {
  notify-send "Starting dm-radio" "Playing station: $1. 🎶"
}

end_radio() {
  notify-send "Stopping dm-radio" "You have quit dm-radio. 🎶"
}

main() {
    choice=$(menu | ${dmenu} 'Choose radio station:' "$@") || exit 1

    case $choice in
    Quit)
        end_radio;
        pkill -f http
        exit
        ;;

    *)
        pkill -f http || echo "Starting mpv..."
        start_radio "$choice" ;
        mpv "${radio_stations["${choice}"]}" --volume="${RADIO_VOLUME:-100}"
        return
        ;;
    esac
}

main
