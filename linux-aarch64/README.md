![image](https://user-images.githubusercontent.com/68618182/149712738-3294351d-208f-4103-bc54-4fb0556e1524.png)

# Archlinux ARM kernel build
Build for the latest linux kernel for Archlinux ARM system (aarch64)

# Version

- linux-aarch64-edge : 5.19.5

- linux-manjaro-aarch64 : 5.19.5

- linux-manjaro-aarch64-lts : 5.15.63

# Build on Archlinux x86_64 system

    cd cross-build/{linux-aarch64-edge,linux-manjaro-aarch64,linux-manjaro-aarch64-lts}
    export CARCH="aarch64"
    makepkg -s

## Installing compiled packages on your Archlinux ARM aarch64 system  

Copy linux-aarch64-edge-x.x.x-x-aarch64.pkg.tar.zst and linux-aarch64-edge-headers-x.x.x-x-aarch64.pkg.tar.zst on your Archlinux ARM aarch64 system and run :

    sudo pacman -U linux-aarch64-edge-x.x.x-x-aarch64.pkg.tar.zst  
    sudo pacman -U linux-aarch64-edge-headers-x.x.x-x-aarch64.pkg.tar.zst     

or

Copy linux-manjaro-aarch64-x.x.x-x-aarch64.pkg.tar.zst and linux-manjaro-aarch64-headers-x.x.x-x-aarch64.pkg.tar.zst on your Archlinux ARM aarch64 system and run :

    sudo pacman -U linux-manajro-aarch64-x.x.x-x-aarch64.pkg.tar.zst  
    sudo pacman -U linux-manjaro-aarch64-headers-x.x.x-x-aarch64.pkg.tar.zst

Copy linux-manjaro-aarch64-lts-x.x.x-x-aarch64.pkg.tar.zst and linux-manjaro-aarch64-lts-headers-x.x.x-x-aarch64.pkg.tar.zst on your Archlinux ARM aarch64 system and run :

    sudo pacman -U linux-manajro-aarch64-lts-x.x.x-x-aarch64.pkg.tar.zst  
    sudo pacman -U linux-manjaro-aarch64-lts-headers-x.x.x-x-aarch64.pkg.tar.zst   

# Prebuild package

Prebuild package are available at https://repo.blacksky3.com/aarch64/kernel

You can add this repo to your pacman.conf

    [kernel]
    SigLevel = Optional TrustAll
    Server = https://repo.blacksky3.com/$arch/$repo

# Sources

https://github.com/archlinuxarm/PKGBUILDs/tree/master/core/linux-aarch64

https://gitlab.manjaro.org/manjaro-arm/packages/core/linux

https://gitlab.manjaro.org/manjaro-arm/packages/core/linux-lts

# Contact info

blacksky3@tuta.io if you have any problems or bugs report.

# Donation

BTC : bc1quz6zcjjy769cn9fd42r89hfh9unr4u2w4sfxer

ETH : 0xF8cBcA16f4eeDfF4a07D173B7fF53906a87b0476

DAI : 0xF8cBcA16f4eeDfF4a07D173B7fF53906a87b0476

LINK : 0xF8cBcA16f4eeDfF4a07D173B7fF53906a87b0476
