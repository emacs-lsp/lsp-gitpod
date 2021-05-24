# FROM gitpod/workspace-full:latest
FROM yyoncho/pgtk

USER gitpod
RUN echo "broadwayd :5 & GDK_BACKEND=broadway BROADWAY_DISPLAY=:5 /home/gitpod/emacs/src/emacs" >> ~/.bashrc
