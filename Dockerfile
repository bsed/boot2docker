FROM boot2docker/boot2docker
# Install the TCZ extra dependencies
ENV TCZ_EXTRA_DEPS nano
RUN for dep in $TCZ_EXTRA_DEPS; do \
    echo "Download $TCL_REPO_BASE/tcz/$dep.tcz" &&\
        curl -fL -o /tmp/$dep.tcz $TCL_REPO_BASE/tcz/$dep.tcz && \
        unsquashfs -f -d $ROOTFS /tmp/$dep.tcz && \
        rm -f /tmp/$dep.tcz ;\
    done
RUN /make_iso.sh
CMD ["cat", "boot2docker.iso"]