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

COPY configs/install-packages.el /tmp/install-packages.el
RUN ~/emacs/src/emacs --batch -l /tmp/install-packages.el

COPY configs/install-servers.el /tmp/install-servers.el
RUN ~/emacs/src/emacs --batch -l /tmp/install-servers.el

RUN rm -rf ~/.emacs.d

RUN git clone --depth 1 https://github.com/syl20bnr/spacemacs /home/gitpod/.emacs.d/ --branch develop
COPY configs/spacemacs.d /home/gitpod/.spacemacs.d

ENV SPACEMACSDIR=~/.spacemacs.d

RUN ~/emacs/src/emacs --batch -l ~/.emacs.d/init.el
RUN mv ~/.emacs.d ~/spacemacs
RUN git clone --depth 1 https://github.com/plexus/chemacs2 /home/gitpod/.emacs.d/

COPY configs/.emacs-profiles.el /home/gitpod/.emacs-profiles.el
COPY configs/vanilla /home/gitpod/vanilla

RUN echo export SPACEMACSDIR=~/.spacemacs.d >> ~/.bashrc
