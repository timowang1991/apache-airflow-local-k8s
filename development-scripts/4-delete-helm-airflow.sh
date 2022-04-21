#!/bin/bash

set -e

./development-scripts/switch-to-local-context.sh

helm delete airflow --namespace airflow