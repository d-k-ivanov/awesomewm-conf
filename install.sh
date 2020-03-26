#!/usr/bin/env bash

# Environment
PROJECT_DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"
AWESOME_CONF_DIR="${HOME}/.config/awesome"


if [ -d ${AWESOME_CONF_DIR} ] ; then
    echo "Awesome config already exist."
    read -r -n 1 -p "Do you want to remove old configuration? (y/[a]): " AMSURE
    [ "$AMSURE" = "y" ] || exit
    echo

    if [ ! -L ${AWESOME_CONF_DIR} ] ; then
        mv -f "${AWESOME_CONF_DIR}" "${AWESOME_CONF_DIR}-${RANDOM}"
    else
        rm -rf "${AWESOME_CONF_DIR}" 2>/dev/null
    fi
fi

ln -sf "${PROJECT_DIR}" "${AWESOME_CONF_DIR}"

