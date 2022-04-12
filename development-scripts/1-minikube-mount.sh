#!/bin/bash

set -e
if [[ $(uname) == "Linux" ]]; then
    echo "You are on Linux. Working on minikube mount"
    minikube mount $(pwd):$(pwd)
fi