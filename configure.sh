#!/bin/bash

MESSAGE="Starting playbook, go take a coffe and enjoy automation :)"

[[ $(ansible --help &> /dev/null) -eq 0 ]] && \
  echo $MESSAGE && sleep 2 && \
  ansible-playbook playbook.yml

if [[ $? -ne 0 ]]; then
  read -sp "Please insert your password: " PASSWORD
  echo
  echo $MESSAGE
  sleep 2
  ansible-playbook -e "ansible_become_password=$PASSWORD" playbook.yml
elif [[ $(ansible --help) &&  $? -ne 0 ]]; then
  echo "Installing Ansible"
  sudo apt update -y &> /dev/null
  sudo apt install ansible -y &> /dev/null
  echo $MESSAGE
  sleep 2
  ansible-playbook playbook.yml
fi
