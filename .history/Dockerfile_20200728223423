FROM boot2docker/boot2docker

ENV ROOTFS          /rootfs
ENV TCL_REPO_BASE   http://tinycorelinux.net/11.x/x86_64
ENV GNU_DEPS file acl attr rsync readline coreutils samba-libs cifs-utils nano

RUN set -ex && \
    for dep in $GNU_DEPS; do \
        echo "Download $TCL_REPO_BASE/tcz/$dep.tcz"; \
        curl --content-disposition $TCL_REPO_BASE/tcz/$dep.tcz; \
        unsquashfs -f -d $ROOTFS /tmp/$dep.tcz; \
        rm -f /tmp/$dep.tcz; \
    done

RUN /make_iso.sh

CMD ["cat", "boot2docker.iso"]