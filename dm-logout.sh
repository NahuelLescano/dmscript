#! /usr/bin/env bash

DMENU="rofi -show-icons -dmenu -i -p"

options=(
    '🚪 Quit'
    '🔄 Reboot'
    '🔌 Shutdown'
)

main() {
    choice=$(printf '%s\n' "${options[@]}" | ${DMENU} 'Menu:' "${@}")

    case $choice in
        '🔄 Reboot')
            if [[ "$(echo -e "No\nYes" | ${DMENU} "${choice}?" "${@}")" == "Yes" ]]; then
                systemctl reboot
            else
                echo "Reboot cancelled." && exit 1
            fi
        ;;

        '🔌 Shutdown')
            if [[ "$(echo -e "No\nYes" | ${DMENU} "${choice}?" "${@}")" == "Yes" ]]; then
                systemctl poweroff
            else
                echo "Shutdown cancelled." && exit 1
            fi
        ;;

        *)
            echo "User choose to close" && exit 1
        ;;
    esac
}

main
