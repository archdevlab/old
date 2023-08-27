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

# build normal package with GCC

# gcc

cd pds/ && makepkg -s && rm -rf pkg/ src/ && cd ${source}

cd bmq/ && makepkg -s && rm -rf pkg/ src/ && cd ${source}

# clang

#cd pds/ && env _compiler=2 makepkg -s && rm -rf pkg/ src/ && cd ${source}

#cd bmq/ && env _compiler=2 makepkg -s && rm -rf pkg/ src/ && cd ${source}

# clean build dir

rm -rf */pkg/
rm -rf */src/
rm -rf */*patch*
rm -rf */*.diff
rm -rf */*config*
