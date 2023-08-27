# _     _            _        _          _____
#| |__ | | __ _  ___| | _____| | ___   _|___ /
#| '_ \| |/ _` |/ __| |/ / __| |/ / | | | |_ \
#| |_) | | (_| | (__|   <\__ \   <| |_| |___) |
#|_.__/|_|\__,_|\___|_|\_\___/_|\_\\__, |____/
#                                  |___/

#Maintainer: blacksky3 <https://github.com/blacksky3>

#!/bin/bash

source=$(pwd)

echo "${source}"

# updpkgsums

cd edge/ && updpkgsums && cd ${source}

cd stable/ && updpkgsums && cd ${source}

cd lts/ && updpkgsums && cd ${source}

cd rt61/ && updpkgsums && cd ${source}
