#/bin/bash
#
#

PETALINUX_ROOT=/app/petalinux/2019.1

function fix {

    F=$(find ${PETALINUX_ROOT} -name "$1" | grep aarch64)

    echo 'true' >> $F

}

fix "update_icon_cache"
fix "update_font_cache"
