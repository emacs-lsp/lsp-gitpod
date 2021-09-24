FROM gitpod/workspace-full

USER gitpod
WORKDIR /home/gitpod

RUN sudo apt-get update && sudo apt-get install -y build-essential git autoconf texinfo libgnutls28-dev libxml2-dev libncurses5-dev libjansson-dev libgtk-3-dev:amd64 libgccjit-9-dev

RUN git clone https://github.com/emacs-mirror/emacs --depth 1 --branch feature/pgtk

WORKDIR /home/gitpod/emacs/
RUN ./autogen.sh
RUN ./configure --with-pgtk --with-cairo --with-modules --with-native-compilation --with-json
RUN NATIVE_FULL_AOT=1 make -j8

WORKDIR /home/gitpod/

RUN mkdir -p .local/share/fonts/
COPY fonts/* .local/share/fonts/

COPY configs/install-packages.el /tmp/install-packages.el
RUN ~/emacs/src/emacs --batch -l /tmp/install-packages.el

USER root
RUN mkdir /workspace/m2-repository/ -p
RUN chown gitpod:gitpod /workspace/m2-repository/
USER gitpod

COPY configs/install-servers.el /tmp/install-servers.el
RUN bash -c ". /home/gitpod/.sdkman/bin/sdkman-init.sh && ~/emacs/src/emacs --batch -l /tmp/install-servers.el"

COPY configs/init.el /home/gitpod/.emacs.d/init.el

COPY startup.el /home/gitpod/
COPY fonts/* ~/.local/share/fonts/
