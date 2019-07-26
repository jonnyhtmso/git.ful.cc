FROM jupyter/base-notebook
USER root
RUN echo "jovyan:1q2w3e4r" | chpasswd && mkdir -p /home/jovyan/.jupyter && \
echo "c.NotebookApp.allow_root = True" > /home/jovyan/.jupyter/jupyter_notebook_config.py && \ 
echo 'jovyan    ALL=(ALL:ALL) ALL' >> /etc/sudoers && \
apt update && apt-get install -y vim iproute2 git cadaver curlftpfs redis golang && /etc/init.d/redis-server start && \
mkdir -p /home/jovyan/work/go/bin/hello && mkdir -p /home/jovyan/work/go/pkg && mkdir -p /home/jovyan/work/go/src/hello/hello && \
touch /home/jovyan/work/go/src/hello/hello.go && \
pip install redis 
CMD ['git clone git@github.com:jonnyhtmso/home.git', '&&','jupyter', 'notebook', '--allow-root' ]