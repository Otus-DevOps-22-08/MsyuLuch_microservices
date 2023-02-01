# MsyuLuch_microservices
MsyuLuch microservices repository

Status of Last Deployment: <br>
<img src="https://github.com/Otus-DevOps-22-08/MsyuLuch_microservices/actions/workflows/%20run-tests.yml/badge.svg"><br>

# Выполнено ДЗ № 19

 - [+] Основное ДЗ
 - [+] Задание со *

## В процессе сделано:

 1. Установили k8s на двух нодах при помощи утилиты kubeadm (версия v1.24.9)


 2. Запустили созданные манифесты в рабочем кластере

      ```
            kubectl apply -f post-deployment.yml

      ```

 3. Описали установку кластера с использованием terraform и ansible

 4. terraform разворачивает 2 ВМ, на которых после выполняются playbooks
      - настройка обоих нод перед разворачиваием кластера
      - настройка мастер-ноды
      - настройка воркер-ноды

 ```
    terraform apply -auto-approve=true
    terraform destroy -auto-approve=true

    ansible-playbook ./playbooks/k8s.yml --skip-tags "master, worker"
    ansible-playbook ./playbooks/k8s.yml --limit masterserver --tags "master"
    ansible-playbook ./playbooks/k8s.yml --limit workerserver --tags "worker"
 ```

 6. Проверили запуск манифестов в развернутом с помощью terraform и ansible кластере

 [img](https://github.com/Otus-DevOps-22-08/MsyuLuch_microservices/tree/kubernetes-1/kubernetes/image.jpg)

## Как запустить проект:

 ```
    terraform apply -auto-approve=true
    terraform destroy -auto-approve=true

    ansible-playbook ./playbooks/k8s.yml --skip-tags "master, worker"
    ansible-playbook ./playbooks/k8s.yml --limit masterserver --tags "master"
    ansible-playbook ./playbooks/k8s.yml --limit workerserver --tags "worker"
 ```

## Как проверить работоспособность:

```
    kubectl cluster-info
    kubectl get nodes
    kubectl get pods -A

    kubectl apply -f post-deployment.yml

    kubectl get all

 ```

## PR checklist
 - [+] Выставил label с темой домашнего задания
