FROM frolvlad/alpine-glibc

ENV PATH=/opt/conda/bin:$PATH \
    LANG=C.UTF-8
ARG ANACONDA3=Anaconda3-2019.07-Linux-x86_64.sh
WORKDIR /root
RUN apk add --no-cache bash wget && \
    wget -q --no-check-certificate https://repo.anaconda.com/archive/${ANACONDA3} && \
    bash ./${ANACONDA3} -b -p /opt/conda && \
    ln -s /opt/conda/bin/* /usr/local/bin/ && \
    rm -rf /root/.[acpw]* ./${ANACONDA3} /opt/conda/pkgs/*
CMD ["bash"]
