# introduction
This playbook will configure the rock64 SBC as a gateway.


# ansible-playbooks

## prepare vaultid file
```
ln -s ~/Dropbox/ansible-vault-id/ansible-playbooks vaultid
```

## encrypt/decrypt sensitive information
```
ansible-vault encrypt roles/gateway/files/* --vault-id @vaultid
ansible-vault decrypt roles/gateway/files/* --vault-id @vaultid

ansible-vault encrypt roles/shadowsocks/files/* --vault-id @vaultid
ansible-vault decrypt roles/shadowsocks/files/* --vault-id @vaultid
```
 
 