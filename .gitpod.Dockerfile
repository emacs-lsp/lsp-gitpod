FROM yyoncho/pgtk:1.0.18

USER gitpod
COPY .bashrc-ex /home/gitpod/.bashrc-ex
RUN echo 'source ~/.bashrc-ex' >> ~/.bashrc
