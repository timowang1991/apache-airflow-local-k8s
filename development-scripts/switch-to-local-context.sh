#!/bin/bash

set -e

if [[ $(uname) == "Darwin" ]]; then
    echo "You are on macbook. Switching to docker-desktop context"
    kubectl config use-context docker-desktop
elif [[ $(uname) == "Linux" ]]; then
    echo "You are on Linux. Switching to minikube context"
    kubectl config use-context minikube
fi