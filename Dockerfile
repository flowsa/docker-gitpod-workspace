FROM gitpod/workspace-full

# Install custom tools, runtime, etc.
RUN brew install drud/ddev/ddev
RUN sudo apt-get update && sudo apt-get install -y xdg-utils tree rsync

RUN curl -LO https://deployer.org/releases/v6.8.0/deployer.phar && sudo mv deployer.phar /usr/local/bin/dep && sudo chmod +x /usr/local/bin/dep
RUN curl -LO https://deployer.org/releases/v4.3.4/deployer.phar && sudo mv deployer.phar /usr/local/bin/dep4 && sudo chmod +x /usr/local/bin/dep4

COPY download.sh .
RUN mkdir -p /ddev_images
RUN bash download.sh /ddev_images/db drud/ddev-dbserver-mariadb-10.3:v1.19.2
RUN bash download.sh /ddev_images/web drud/ddev-webserver:v1.19.2
RUN bash download.sh /ddev_images/router drud/ddev-router:v1.19.0
RUN bash download.sh /ddev_images/ssh drud/ddev-ssh-agent:v1.19.0


