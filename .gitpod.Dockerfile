# FROM gitpod/workspace-full:latest
FROM yyoncho/pgtk:1.0

USER gitpod
RUN echo "broadwayd :5 & GDK_BACKEND=broadway BROADWAY_DISPLAY=:5 /home/gitpod/emacs/src/emacs &" >> ~/.bashrc
