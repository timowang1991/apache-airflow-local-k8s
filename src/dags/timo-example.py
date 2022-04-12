from datetime import datetime, timedelta

from airflow import DAG
from airflow.providers.cncf.kubernetes.operators.kubernetes_pod import KubernetesPodOperator
from airflow.operators.python_operator import PythonOperator

import json

def printSomething():
    return 'print something'

with DAG(
    'timo-example',

    default_args={
        'depends_on_past': False,
        'retries': 1,
        'retry_delay': timedelta(minutes=5),
    },
    description='timo-example DAG',
    schedule_interval=timedelta(minutes=1),
    start_date=datetime(2022, 4, 1),
    catchup=False,
) as dag:

    content = json.dumps({
        'hello': 'world'
    })

    t1 = PythonOperator(
        task_id='print_something',
        python_callable=printSomething
    )

    t2 = KubernetesPodOperator(
        task_id='try_template',
        name='try_template',
        namespace='airflow',
        image='node:16-alpine3.12',
        cmds=['node', '-e', 'console.log(\'===================\',process.env)'],
        env_vars={
            'TEST_TEMPLATE': '{{ti.xcom_pull(task_ids="print_something")}}'
        }
    )

    t1 >> t2
