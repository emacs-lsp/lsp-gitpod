FROM gitpod/workspace-full

USER gitpod
WORKDIR /home/gitpod

RUN git clone https://github.com/emacs-mirror/emacs --depth 1 --branch feature/pgtk
WORKDIR /home/gitpod/emacs/
RUN sudo apt-get update && sudo apt-get install -y build-essential git autoconf texinfo libgnutls28-dev libxml2-dev libncurses5-dev libjansson-dev
RUN sudo apt-get install libgtk-3-dev:amd64 -y
RUN sudo apt-get install libgccjit-9-dev -y
RUN ./autogen.sh
RUN ./configure --with-pgtk --with-cairo --with-modules --with-native-compilation --with-json
RUN NATIVE_FULL_AOT=1 make -j8

WORKDIR /home/gitpod/

RUN mkdir /home/gitpod/.emacs.d

COPY configs/install-packages.el /tmp/install-packages.el
RUN ~/emacs/src/emacs --batch -l /tmp/install-packages.el

COPY configs/install-servers.el /tmp/install-servers.el
RUN ~/emacs/src/emacs --batch -l /tmp/install-servers.el

COPY configs/init.el /home/gitpod/.emacs.d/init.el
