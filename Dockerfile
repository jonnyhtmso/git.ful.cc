FROM jupyter/base-notebook
USER root
ENV GOPATH=/home/jovyan/home/go/
RUN echo "jovyan:1q2w3e4r" | chpasswd && mkdir -p /home/jovyan/.jupyter && \
echo "c.NotebookApp.allow_root = True" > /home/jovyan/.jupyter/jupyter_notebook_config.py && \ 
echo 'jovyan    ALL=(ALL:ALL) ALL' >> /etc/sudoers && \
apt update && apt-get install -y vim iproute2 git cadaver curlftpfs redis golang cron iputils-ping unzip&& /etc/init.d/redis-server start && \
mkdir -p /home/jovyan/work/go/bin/hello && mkdir -p /home/jovyan/work/go/pkg && mkdir -p /home/jovyan/work/go/src/hello/hello && \
touch /home/jovyan/work/go/src/hello/hello.go && \
cd /home/jovyan/ && git clone https://github.com/jonnyhtmso/home.git && \
/bin/bash /home/jovyan/home/doc/init.sh && \
pip install -r /home/jovyan/home/requirement.txt && \
chown -R jovyan /home/jovyan/home 
CMD ['jupyter', 'notebook', '--allow-root' ]
