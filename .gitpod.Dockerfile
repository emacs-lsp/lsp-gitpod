FROM yyoncho/pgtk:1.0.16

USER gitpod
COPY .bashrc-ex ~/.bashrc-ex
RUN echo 'source ~/.bashrc-ex' >> ~/.bashrc
