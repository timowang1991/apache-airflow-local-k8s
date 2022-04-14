from datetime import datetime, timedelta

from airflow import DAG
from airflow.providers.cncf.kubernetes.operators.kubernetes_pod import KubernetesPodOperator
from airflow.operators.python_operator import PythonOperator

from tasks.print_something_task import printSomethingTask

def printSomething():
    return 'print something'

with DAG(
    'timo_example',

    default_args={
        'depends_on_past': False,
        'retries': 1,
        'retry_delay': timedelta(minutes=5),
    },
    description='timo_example DAG',
    schedule_interval=timedelta(minutes=1),
    start_date=datetime(2022, 4, 1),
    catchup=False,
) as dag:

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

    t3 = PythonOperator(
        task_id='print_something_task',
        python_callable=printSomethingTask
    )

    t1 >> t2 >> t3
