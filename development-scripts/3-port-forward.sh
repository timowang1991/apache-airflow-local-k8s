#!/bin/bash

echo "Run this command on your macbook."

kubectl port-forward deployments/airflow-webserver 8080:8080