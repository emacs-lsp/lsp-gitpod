FROM yyoncho/pgtk:1.0.18

USER gitpod
RUN echo 'source ~/.bashrc-ex' >> ~/.bashrc
COPY .bashrc-ex /home/gitpod/.bashrc-ex
