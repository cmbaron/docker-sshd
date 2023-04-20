#!/bin/bash
# Update the keys stored in ssh.yaml from the authorized-keys file
kubectl --namespace default delete secret ssh-keys
kubectl --namespace default create secret generic ssh-keys --from-file=~/.ssh/authorized_keys
