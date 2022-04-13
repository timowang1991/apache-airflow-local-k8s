#!/bin/bash

echo "Run this command on your macbook."

if [[ $(uname) == "Linux" ]]; then
    exit 1
fi

kubectl port-forward deployments/airflow-webserver 8080:8080