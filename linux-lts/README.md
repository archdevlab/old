# linux-lts

Linux kernel build for Archlinux with Arch, Block, CPU, Futex, Wine and kernel_compiler_patch patch.

# Version

- 5.15.58

# Build

    git clone https://github.com/blacksky3/linux-lts.git
    cd linux-lts/{bore,cacule,cacule-rdb,tt,tt-cfs,pds,bmq}
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

To come ...

## CacULE CPU Scheduler

![cacule_sched](https://user-images.githubusercontent.com/68618182/103179297-92ac0100-4858-11eb-83aa-8992f33d67f8.png)

CacULE is a newer version of Cachy. The CacULE CPU scheduler is based on interactivity score mechanism.
The interactivity score is inspired by the ULE scheduler (FreeBSD scheduler).

About CacULE Scheduler

- Each CPU has its own runqueue.
- NORMAL runqueue is a linked list of sched_entities (instead of RB-Tree).
- RT and other runqueues are just the same as the CFS's.
- Wake up tasks preempt currently running tasks if its interactivity score value is higher.

### RDB load balancer

An experimental load balancer for CacULE. It is a lightweight load balancer which is a replacement of CFS load balancer.
It migrates tasks based on their interactivity scores.

## TT CPU Scheduler

Task Type (TT) is an alternative CPU Scheduler for linux.

The goal of the Task Type (TT) scheduler is to detect tasks types based on their behaviours and control the schedulling based on their types. There are 5 types:

1. REALTIME
2. INTERACTIVE
3. NO_TYPE
4. CPU_BOUND
5. BATCH

Find the descriptions and the detection rules in tasks.ods

The benefit of task types is to allow the scheduler to have more control and choose the best task to run next in the CPU.

TT gives RT tasks a -20 prio in vruntime calculations. This boosts RT tasks over other tasks. The preemption rules are purely HRRN where RT tasks have a priority since their vruntimes are relatively less than other types. The reason of using HRRN instead of hard level picking is to smooth out the preemtions and to prevent any chance of starvation.

## BMQ CPU Scheduler

BitMap Queue CPU scheduler, referred to as BMQ from here on, is an evolution
of previous Priority and Deadline based Skiplist multiple queue scheduler(PDS),
and inspired by Zircon scheduler. The goal of it is to keep the scheduler code
simple, while efficiency and scalable for interactive tasks, such as desktop,
movie playback and gaming etc.

BMQ use per CPU run queue design, each CPU(logical) has it's own run queue,
each CPU is responsible for scheduling the tasks that are putting into it's
run queue.

The run queue is a set of priority queues. Note that these queues are fifo
queue for non-rt tasks or priority queue for rt tasks in data structure. See
BitMap Queue below for details. BMQ is optimized for non-rt tasks in the fact
that most applications are non-rt tasks. No matter the queue is fifo or
priority, In each queue is an ordered list of runnable tasks awaiting execution
and the data structures are the same. When it is time for a new task to run,
the scheduler simply looks the lowest numbered queueue that contains a task,
and runs the first task from the head of that queue. And per CPU idle task is
also in the run queue, so the scheduler can always find a task to run on from
its run queue.

Each task will assigned the same timeslice(default 4ms) when it is picked to
start running. Task will be reinserted at the end of the appropriate priority
queue when it uses its whole timeslice. When the scheduler selects a new task
from the priority queue it sets the CPU's preemption timer for the remainder of
the previous timeslice. When that timer fires the scheduler will stop execution
on that task, select another task and start over again.

If a task blocks waiting for a shared resource then it's taken out of its
priority queue and is placed in a wait queue for the shared resource. When it
is unblocked it will be reinserted in the appropriate priority queue of an
eligible CPU.

BMQ supports DEADLINE, FIFO, RR, NORMAL, BATCH and IDLE task policy like the
mainline CFS scheduler. But BMQ is heavy optimized for non-rt task, that's
NORMAL/BATCH/IDLE policy tasks.

## PDS CPU Scheduler

Priority and Deadline based Skiplist multiple queue scheduler, referred to as
PDS from here on, is developed upon the enhancement patchset VRQ(Variable Run
Queue) for BFS(Brain Fuck Scheduler by Con Kolivas). PDS inherits the existing
design from VRQ and inspired by the introduction of skiplist data structure
to the scheduler by Con Kolivas. However, PDS is different from MuQSS(Multiple
Queue Skiplist Scheduler, the successor after BFS) in many ways.

PDS is designed to make the cpu process scheduler code to be simple, but while
efficiency and scalable. Be Simple, the scheduler code will be easy to be read
and the behavious of scheduler will be easy to predict. Be efficiency, the
scheduler shall be well balance the thoughput performance and task interactivity
at the same time for different properties the tasks behave. Be scalable, the
performance of the scheduler should be in good shape with the glowing of
workload or with the growing of the cpu numbers.

PDS is described as a multiple run queues cpu scheduler. Each cpu has its own
run queue. A heavry customized skiplist is used as the backend data structure
of the cpu run queue. Tasks in run queue is sorted by priority then virtual
deadline(simplfy to just deadline from here on). In PDS, balance action among
run queues are kept as less as possible to reduce the migration cost. Cpumask
data structure is widely used in cpu affinity checking and cpu preemption/
selection to make PDS scalable with increasing cpu number.

# Update GRUB

    sudo grub-mkconfig -o /boot/grub/grub.cfg

# Info

You can refer to this Archlinux page that have lots of useful information to build the kernel and debugging if you have some issues https://wiki.archlinux.org/index.php/Kernel/Traditional_compilation

# Contact info

blacksky3@tuta.io if you have any problems or bugs report.

# Donation

BTC : bc1quz6zcjjy769cn9fd42r89hfh9unr4u2w4sfxer

ETH : 0xF8cBcA16f4eeDfF4a07D173B7fF53906a87b0476

DAI : 0xF8cBcA16f4eeDfF4a07D173B7fF53906a87b0476

LINK : 0xF8cBcA16f4eeDfF4a07D173B7fF53906a87b0476
