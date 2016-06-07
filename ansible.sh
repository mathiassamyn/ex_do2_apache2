#!/usr/bin/env bash

# install ansible (http://docs.ansible.com/intro_installation.html)
apt-get -y install software-properties-common
apt-add-repository -y ppa:ansible/ansible
apt-get update
apt-get -y install ansible sshpass

ln -sf /vagrant/hostnames /etc/hosts

ln -sf /vagrant/hosts /etc/ansible/hosts

rm /home/vagrant/.ssh/known_hosts

ssh-keyscan lb www1 www2 mgr >> /home/vagrant/.ssh/known_hosts
chown vagrant:vagrant /home/vagrant/.ssh/known_hosts

ansible-playbook /vagrant/provisioning.yml



