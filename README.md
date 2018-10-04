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
 
 