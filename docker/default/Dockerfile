FROM yyoncho/gitpod-base:1.0.12

USER root
RUN chown gitpod:gitpod /workspace

USER gitpod

RUN mv .emacs.d vanilla

COPY .emacs-profiles.el /home/gitpod/.emacs-profiles.el
RUN git clone --depth 1 https://github.com/plexus/chemacs2 /home/gitpod/.emacs.d/

COPY --from=yyoncho/gitpod-doom:1.0.0 /home/gitpod/.emacs.d /home/gitpod/doom

COPY --from=yyoncho/gitpod-spacemacs:1.0.10 /home/gitpod/.emacs.d /home/gitpod/spacemacs
COPY --from=yyoncho/gitpod-spacemacs:1.0.10 /home/gitpod/.spacemacs.d /home/gitpod/.spacemacs.d

USER root
RUN chown gitpod:gitpod *
USER gitpod

RUN ln -s /home/gitpod/vanilla/.cache/lsp /home/gitpod/spacemacs/.cache/

USER root
RUN ln -s /home/gitpod/vanilla/.cache doom/
USER gitpod

RUN ln -s /home/gitpod/spacemacs/eln-cache /home/gitpod/.emacs.d/

COPY .bashrc-ex /home/gitpod/.bashrc-ex
RUN echo 'source ~/.bashrc-ex' >> ~/.bashrc

COPY --from=yyoncho/gitpod-doom:1.0.0 /home/gitpod/.config/doom /home/gitpod/.config/doom

USER root



USER gitpod
