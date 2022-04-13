#!/bin/bash

set -e
if [[ $(uname) == "Linux" ]]; then
    echo "You are on Linux. Working on minikube mount."
    minikube mount $(pwd):$(pwd)
elif [[ $(uname) == "Darwin" ]]; then
    echo "You are on Macbook. No need to run this command."
fi