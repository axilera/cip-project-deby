CIP Core (Tiny Profile) with Debian 10 buster
=============================================

This branch provides recipes to generate CIP core tiny profile images
based on Debian 10 buster userland packages.

Supported Software
==================

The build targets of this branch are the following kernel and userland versions.

* Kernel:
    * [linux-4.19.y-cip](https://git.kernel.org/pub/scm/linux/kernel/git/cip/linux-cip.git/log/?h=linux-4.19.y-cip)
    * [linux-4.19.y-cip-rt](https://git.kernel.org/pub/scm/linux/kernel/git/cip/linux-cip.git/log/?h=linux-4.19.y-cip-rt)
* Userland: Debian 10 buster

All recipes in this branch are compatible with the following Yocto Project version.

* Yocto Project 2.7 (warrior)

Supported Hardware
==================

The following boards are supported in this branch.

* `qemux86-64`: QEMU x86 64bit (Q35 machine)
* `bbb`: BeagleBone Black

Build Target Images
===================

Select the target board from [Supported Hardware](#supported-hardware)
and set it to `MACHINE` variable.

Example:

    $ MACHINE=qemux86-64

Setup the [kas](https://github.com/siemens/kas) docker script.

    $ wget https://raw.githubusercontent.com/siemens/kas/master/kas-docker
    $ chmod a+x kas-docker

Build images with `kas-docker`.

    $ ./kas-docker build kas-${MACHINE}.yml

Run Images on the target board
==============================

QEMU
----

    $ ./start-qemu.sh ${MACHINE}
