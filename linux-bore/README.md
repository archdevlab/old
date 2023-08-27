# linux-bore

Linux kernel build for Archlinux with Masahito Suzuki BORE CPU scheduler with Arch and other improvement patches.

# Version

- 6.4.0

# Build

    git clone https://github.com/blacksky3/linux-bore.git
    cd linux-bore/{bore,bore-nosystl,bore-eevdf}
    env_compiler=(1 or 2) makepkg -s

# Build variables

### _compiler

- Will set compiler to build the kernel :

        1 : GCC
        2 : CLANG+LLVM

If not set it will build with GCC by default.

# Prebuild package

Prebuild package are available at https://repo.blacksky3.com/x86_64/kernel

You can add this repo to your pacman.conf

    [kernel]
    SigLevel = Optional TrustAll
    Server = https://repo.blacksky3.com/$arch/$repo

# CPU Scheduler

## BORE (Burst-Oriented Response Enhancer) CPU Scheduler

BORE (Burst-Oriented Response Enhancer) is enhanced versions of CFS (Completely Fair Scheduler) and EEVDF (Earliest Eligible Virtual Dealine First) Linux schedulers. Developed with the aim of maintaining these schedulers' high performance while delivering resilient responsiveness to user input under as versatile load scenario as possible.

To achieve this, BORE introduces a dimension of flexibility known as "burstiness" for each individual tasks, partially departing from CFS's inherent "complete fairness" principle. Burstiness refers to the score derived from the accumulated CPU time a task consumes after explicitly relinquishing it, either by entering sleep, IO-waiting, or yielding. This score represents a broad range of temporal characteristics, spanning from nanoseconds to hundreds of seconds, varying across different tasks.

Leveraging this burstiness metric, BORE dynamically adjusts scheduling properties such as weights and delays for each task. Consequently, in systems experiencing diverse types of loads, BORE prioritizes tasks requiring high responsiveness, thereby improving overall system responsiveness and enhancing the user experience.
The final effect is an equilibrium between opposing greedy and weak tasks (usually CPU-bound batch tasks) and modest and strong tasks (usually I/O-bound interactive tasks), providing a more responsive user experience under the coexistence of various types of workloads.
### How it works

- The scheduler tracks each task's burst time, which is the amount of CPU time the task has consumed since it last yielded, slept, or waited for I/O.
- While a task is active, its burst score is continuously calculated by counting the bit count of its normalized burst time and adjusting it using pre-configured offset and coefficient.
- The burst score functions similarly to "niceness" and takes a value between 0-39. For each decrease in value by 1, the task can consume approximately 1.25x longer timeslice.
- This process acts as a radix conversion from binary logarithm to common logarithm, converting between two different magnitudes (nano-seconds-to-minutes timescale to about 0.01-100x scale) dimensionlessly.
- As a result, less "greedy" tasks are given more timeslice and wakeup preemption aggressiveness, while greedier tasks that yield their timeslice less frequently are weighted less.
- The burst score of newly-spawned processes is calculated in a unique way to prevent tasks like "make" from overwhelming interactive tasks by forking many CPU-hungry children.
- The final effect is an equilibrium between opposing greedy and weak tasks (usually CPU-bound batch tasks) and modest and strong tasks (usually I/O-bound interactive tasks), providing a more responsive user experience under the coexistence of various types of workloads.

# Update GRUB

    sudo grub-mkconfig -o /boot/grub/grub.cfg

# Info

You can refer to this Archlinux page that have lots of useful information to build the kernel and debugging if you have some issues https://wiki.archlinux.org/index.php/Kernel/Traditional_compilation

# Donation

BTC : bc1quz6zcjjy769cn9fd42r89hfh9unr4u2w4sfxer

ETH : 0xF8cBcA16f4eeDfF4a07D173B7fF53906a87b0476

DAI : 0xF8cBcA16f4eeDfF4a07D173B7fF53906a87b0476

LINK : 0xF8cBcA16f4eeDfF4a07D173B7fF53906a87b0476
