FROM yyoncho/gitpod-base:1.0.9

USER gitpod

RUN rm -rf ~/.emacs.d

RUN git clone --depth 1 https://github.com/syl20bnr/spacemacs /home/gitpod/.emacs.d/ --branch develop
COPY spacemacs.d /home/gitpod/.spacemacs.d

# RUN SPACEMACSDIR=~/.spacemacs.d ~/emacs/src/emacs --batch -l ~/.emacs.d/init.el -e "wait-for-native-comp"
COPY initialize-spacemacs.el /home/gitpod/initialize-spacemacs.el

RUN LSP_USE_PLISTS=true SPACEMACSDIR=~/.spacemacs.d ~/emacs/src/emacs --batch -l /home/gitpod/initialize-spacemacs.el
