#!/bin/sh

readonly vpn_PATH="$HOME"

openvpn=$(pgrep -a openvpn)
openfortivpn=$(pgrep -a openfortivpn)

function display_yad {
    cmd=(
        yad
        --undecorated --fixed --close-on-unfocus --borders=0
        --button="Kill VPN"
        --posx="1320" --posy="80"
    )
    "${cmd[@]}"
    exval=$?
}

if [ -n "$openvpn" ] ; then
    display_yad
    case $exval in
        0) pgrep openvpn | pkexec xargs kill;;
    esac
elif [ -n "$openfortivpn" ] ; then
    display_yad
    case $exval in
        0) pgrep openfortivpn | pkexec xargs kill;;
    esac
else
    file=$(cd $vpn_PATH && yad --file)
    extension="${file##*.}"
    case $extension in
        "ovpn") pkexec openvpn $file;;
        "conf") pkexec openfortivpn -c $file;;
    esac
fi
