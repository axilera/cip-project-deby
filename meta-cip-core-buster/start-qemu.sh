#!/bin/sh

usage() {
	echo "Usage: ${0} <MACHINE> [QEMU_OPTS]"
	exit 1
}

MACHINE="${1}"
if [ -z "${MACHINE}" ]; then
	usage
fi

DEPLOY_DIR=build/tmp/deploy/images/${MACHINE}

case "${MACHINE}" in
	"qemux86-64")
		QEMU="qemu-system-x86_64"
		KERNEL=${DEPLOY_DIR}/bzImage
		INITRD=${DEPLOY_DIR}/core-image-minimal-${MACHINE}.cpio.gz
		APPEND="console=ttyS0"
		;;
	*)
		echo "Invalid MACHINE"
		exit 1
		;;
esac

if [ -z "${DISPLAY}" ]; then
	QEMU_OPTS="${QEMU_OPTS} -nographic"
fi

shift

${QEMU} \
	-m 1G \
	-kernel ${KERNEL} \
	-initrd ${INITRD} \
	-append "${APPEND}" \
	${QEMU_OPTS} ${@}
