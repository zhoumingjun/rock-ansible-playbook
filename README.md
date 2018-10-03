# ansible-playbooks

## prepare vaultid file
```
ln -s ~/Dropbox/ansible-vault-id/ansible-playbooks vaultid
```

## encrypt/decrypt sensitive information
```
ansible-vault encrypt roles/gateway/files/* --vault-id @vaultid
ansible-vault decrypt roles/gateway/files/* --vault-id @vaultid
```
 
 