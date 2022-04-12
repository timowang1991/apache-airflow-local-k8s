#!/bin/bash

./development-scripts/switch-to-local-context.sh

sed "s+{{CURRENT_DIRECTORY}}+$(pwd)+g" helm/values.template.yaml > helm/values.yaml

helm repo add apache-airflow https://airflow.apache.org
helm upgrade --install -f helm/values.yaml airflow apache-airflow/airflow --namespace airflow --create-namespace

kubectl apply -f k8s/airflow-webserver-node-port-service.yaml