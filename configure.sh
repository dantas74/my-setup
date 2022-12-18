#!/bin/bash

[[ $(ansible --help &> /dev/null) -eq 0 ]] && ansible-playbook playbook.yml

if [[ $? -ne 0 && $(ansible --help) &&  $? -eq 0 ]]; then
  read -sp "Please insert your password: " PASSWORD
  echo
  echo "Starting playbook, go take a coffe and enjoy automation :)"
  sleep 2
  ansible-playbook -e "ansible_become_password=$PASSWORD" playbook.yml
else
  echo "Installing Ansible"
  sudo apt update -y &> /dev/null
  sudo apt install ansible -y &> /dev/null
  echo "Starting playbook, go take a coffe and enjoy automation :)"
  sleep 2
  ansible-playbook playbook.yml
fi
