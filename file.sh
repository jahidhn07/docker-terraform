#!/bin/bash

sudo yum install -y yum-utils
sudo yum-config-manager --add-repo https://rpm.releases.hashicorp.com/AmazonLinux/hashicorp.repo
sudo yum -y install terraform
sudo touch ~/.bashrc
sudo terraform -install-autocomplete
sudo amazon-linux-extras install docker
sudo service docker start
sudo usermod -a -G docker ec2-user
sudo chkconfig docker on
sudo yum install -y git
sudo curl -L https://github.com/docker/compose/releases/download/1.22.0/docker-compose-$(uname -s)-$(uname -m) -o /usr/local/bin/docker-compose
sudo chmod +x /usr/local/bin/docker-compose
sudo systemctl enable docker

sudo amazon-linux-extras install epel -y
curl -sL https://rpm.nodesource.com/setup_16.x | sudo bash -
sudo yum install gcc-c++ make -y
curl -sL https://dl.yarnpkg.com/rpm/yarn.repo | sudo tee /etc/yum.repos.d/yarn.repo
sudo yum install gcc-c++ make -y
sudo yum install node yarn -y


sudo mkdir /home/docker
cd /home/docker
sudo git clone https://github.com/jahidhn07/docker-terraform.git
cd /home/docker/docker-terraform
sudo rm -fr web
sudo chown -Rf 1000:1000 /home/docker/docker-terraform
cd /home/docker/docker-terraform
sudo chmod +x web.sh
sudo -u ec2-user /home/docker/docker-terraform/web.sh
sudo cp env_example .env
sudo cp Dockerfile-web web/Dockerfile
docker-compose up -d --build
sudo cp index.html.web /home/docker/docker-terraform/web/public/index.html

