# ansible-playbooks

## prepare vaultid file
```
ln -s ~/Dropbox/ansible-vault-id/ansible-playbooks vaultid
```

## encrypt/decrypt sensitive information
```
ansible-vault encrypt roles/v2ray/files/* --vault-id @vaultid
ansible-vault decrypt roles/v2ray/files/* --vault-id @vaultid
```

## references   
* miniconda: https://github.com/robinandeer/ansible-miniconda 


# configuration

## services
systemctl list-units --type=service --state=running

systemctl list-units --type=service --state=active


ip route add default via 10.0.0.1