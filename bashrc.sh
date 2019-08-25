if [ ! $install_status ]; then
    apt -y update
    pip install -r /home/jovyan/work/requirement.txt
    apt-get install -y vim
    apt-get install -y cron
    apt-get install -y language-pack-zh-han*
    dpkg -i /home/jovyan/work/google-chrome*; sudo apt-get -f install -y
    cp /home/jovyan/work/chromedriver /usr/local/bin
    export install_status=1
    echo 'export install_status=1' >>/etc/profile
    echo 'source /etc/profile' >> /home/jovyan/.bashrc
fi