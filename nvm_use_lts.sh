#!/bin/bash

if [ -z "$1" ]; then
    nvm use
    return $?
fi

local lts_version
case "$1" in
    f) lts_version="fermium" ;;
    g) lts_version="gallium" ;;
    h) lts_version="hydrogen" ;;
    *) echo "Unsupported Node.js LTS version."; return 1 ;;
esac

nvm use "lts/$lts_version"
