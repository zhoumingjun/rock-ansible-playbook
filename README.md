# introduction
This playbook will configure the rock64 SBC as a gateway.

# ansible-playbooks

## prepare vaultid file
```
ln -s ~/Dropbox/ansible-vault-id/ansible-playbooks vaultid
```

## encrypt/decrypt sensitive information
```
ansible-vault encrypt host_vars/* --vault-id @vaultid
ansible-vault decrypt host_vars/* --vault-id @vaultid
 
```
 
##  install rock64
ansible-playbook rock64.yml -i hosts --user rock64 --ask-become-pass  --vault-id @vaultid  -vv

## install rpizw
ansible-playbook rpizw.yml -i hosts --user pi --ask-become-pass  --vault-id @vaultid  -vv