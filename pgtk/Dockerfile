FROM gitpod/workspace-full

USER gitpod
WORKDIR /home/gitpod

RUN git clone https://github.com/emacs-mirror/emacs --depth 1 --branch feature/pgtk
WORKDIR /home/gitpod/emacs/
RUN sudo apt-get update && sudo apt-get install -y build-essential git autoconf texinfo libgnutls28-dev libxml2-dev libncurses5-dev libjansson-dev
RUN sudo apt-get install libgtk-3-dev:amd64 -y
RUN sudo apt-get install libgccjit-9-dev -y
RUN ./autogen.sh
RUN ./configure --with-pgtk --with-cairo --with-modules --with-native-compilation
RUN make -j8

WORKDIR /home/gitpod/

RUN git clone https://github.com/yyoncho/elegant-emacs .emacs.d
RUN sudo apt-get install fonts-roboto -y
