#/bin/bash
#
# Move some post install intercept scripts to a hold directory
# which effectively disables them from running.

PETALINUX_ROOT=/app/petalinux/2019.1

function fix {

    F=$(find ${PETALINUX_ROOT} -name "$1" | grep aarch64)
    echo "$1: $F"

    DIR=$(dirname ${F})

    #echo '#!/bin/sh' >  $F
    #echo 'true'      >> $F

    HOLD=${DIR}/hold
    if [ ! -e "${HOLD}" ]
    then
	echo "Creating Dir: ${HOLD}"
	mkdir "${HOLD}"
    fi

    mv "${F}" "${HOLD}"

}

fix "update_icon_cache"
fix "update_font_cache"
fix "update_pixbuf_cache"
fix "update_gio_module_cache"
