#!/bin/bash

echo "Run this command on your macbook."

if [[ -z "${VM_HOST}" ]]; then
    echo "Enter your VM host:"
    read INPUT_VM_HOST
    export VM_HOST=${INPUT_VM_HOST}
fi

ssh -N -p 22 ${VM_HOST} -L 127.0.0.1:8080:$(ssh ${VM_HOST} "minikube ip"):30080