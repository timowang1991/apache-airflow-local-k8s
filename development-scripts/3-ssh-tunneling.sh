#!/bin/bash

VM_HOST=<your-vm-host>

ssh -N -p 22 ${VM_HOST} -L 127.0.0.1:8080:$(ssh ${VM_HOST} "minikube ip"):30080