# linux-rc

Linux kernel build for Archlinux with Arch, Block, CPU, Futex and kernel_compiler_patch patch.

# Version

- 6.3-rc6

# Build

    git clone https://github.com/blacksky3/linux-rc.git
    cd linux-rc
    env_compiler=(1 or 2) makepkg -s

# Build variables

### _compiler

- Will set compiler to build the kernel :

        1 : GCC
        2 : CLANG+LLVM

If not set it will build with GCC by default.

# Prebuild package

Prebuild package are available at https://repo.blacksky3.com/x86_64/linux-rc

You can add this repo to your pacman.conf

    [linux-rc]
    SigLevel = Optional TrustAll
    Server = https://repo.blacksky3.com/$arch/$repo

# Update GRUB

    sudo grub-mkconfig -o /boot/grub/grub.cfg

# Info

You can refer to this Archlinux page that have lots of useful information to build the kernel and debugging if you have some issues https://wiki.archlinux.org/index.php/Kernel/Traditional_compilation

# Donation

BTC : bc1quz6zcjjy769cn9fd42r89hfh9unr4u2w4sfxer

ETH : 0xF8cBcA16f4eeDfF4a07D173B7fF53906a87b0476

DAI : 0xF8cBcA16f4eeDfF4a07D173B7fF53906a87b0476

LINK : 0xF8cBcA16f4eeDfF4a07D173B7fF53906a87b0476
