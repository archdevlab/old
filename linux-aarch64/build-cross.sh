
# _     _            _        _          _____
#| |__ | | __ _  ___| | _____| | ___   _|___ /
#| '_ \| |/ _` |/ __| |/ / __| |/ / | | | |_ \
#| |_) | | (_| | (__|   <\__ \   <| |_| |___) |
#|_.__/|_|\__,_|\___|_|\_\___/_|\_\\__, |____/
#                                  |___/

#Maintainer: blacksky3 <blacksky3@tuta.io> <https://github.com/blacksky3>

#!/bin/bash

source=$(pwd)

echo "${source}"

export CARCH="aarch64"

cd cross-build/linux-aarch64-edge && makepkg -s && rm -rf pkg/ src/ && cd ${source}

cd cross-build/linux-manjaro-aarch64 && makepkg -s && rm -rf pkg/ src/ && cd ${source}

cd cross-build/linux-manjaro-aarch64-lts && makepkg -s && rm -rf pkg/ src/ && cd ${source}

# clean build dir

rm -rf */pkg/
rm -rf */src/
rm -rf */*patch*
rm -rf */*.diff
rm -rf */*config*
