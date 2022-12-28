#!/bin/bash

echo "Installing Ansible"

sudo apt update -y &> /dev/null
sudo apt install ansible -y &> /dev/null

echo "Starting playbook, go take a coffe and enjoy automation :)"

ansible-playbook playbook.yml --ask-become-pass
