#!/bin/bash

set -e

if [[ $(uname) == "Darwin" ]]; then
    echo "You are on Macbook. No need to run this command."
    exit 0
fi

MINIKUBE_PID=$(ps -x | grep -m 1 "minikube mount $(pwd):$(pwd)" | awk -F " " '{ print $1 }')

kill ${MINIKUBE_PID}