#!/bin/sh

vpn="$(nmcli -t -f name,type connection show --order name --active 2>/dev/null | grep vpn | head -1 | cut -d ':' -f 1)"
default_vpn="r3vpn"

case "$1" in
    --disconnect)
        nmcli con down $vpn
        ;;
    --connect)
        nmcli con up $vpn
        ;;
    --toggle)
        if [ -n "$vpn" ]; then
            nmcli con down $vpn
        else
            nmcli con up $default_vpn
        fi
        ;;
    *)
        if [ -n "$vpn" ]; then
                echo "%{F#f9dd04}%{F-} $vpn"
        else
                echo %{F#707880}%{F-}
        fi
        ;;
esac
