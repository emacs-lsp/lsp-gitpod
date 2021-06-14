FROM yyoncho/pgtk:1.0.15

USER gitpod
RUN echo 'broadwayd :5 & \n \
    pid=$(pidof emacs) \n \
    if [ -z $pid ] \n \
    then \n \
    GDK_BACKEND=broadway BROADWAY_DISPLAY=:5 /home/gitpod/emacs/src/emacs $FILE & \n \
    fi' >> ~/.bashrc
