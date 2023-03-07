# MsyuLuch_microservices
MsyuLuch microservices repository

Status of Last Deployment: <br>
<img src="https://github.com/Otus-DevOps-22-08/MsyuLuch_microservices/actions/workflows/%20run-tests.yml/badge.svg"><br>

# Выполнено ДЗ № 20

 - [+] Основное ДЗ
 - [+] Задание со *

## В процессе сделано:

 1. Развернули k8s локально, с помощью утилиты minikube. Установили kubectl.


 2. Описали манифесты для приложения (все исходники в папке ./kubernetes/reddit). Создали свой namespace `dev`.
 Запустили все описанные ранее манифесты в этом пространстве.

      ```
      Deployment основных составляющих reddit (описание процесса деплоя):
      ui-deployment.yml
      post-deployment.yml
      comment-deployment.yml
      mongo-deployment.yml

      Services основных составляющих reddit (для связи компонентов между собой и с внешним миром):
      comment-service.yml
      mongodb-service.yml
      post-service.yml
      ui-service.yml
      ```


      ```
            kubectl apply -f dev-namespace.yml
            kubectl apply -f . -n dev
            kubectl port-forward ui-<id> 9292:9292
      ```

 3. Описали установку кластера с использованием terraform

 ```

resource "yandex_kubernetes_cluster" "k8s-zonal" {
  name        = "test-cluster"
  network_id  = yandex_vpc_network.k8s-network.id

............
}

resource "yandex_kubernetes_node_group" "k8s-group" {
  cluster_id = yandex_kubernetes_cluster.k8s-zonal.id
  name       = "k8s-group"
  version    = "1.23"

.......
}

resource "yandex_vpc_network" "k8s-network" {
  name = "k8s-network"
}
.......
```

 4. Deploy and Access the Kubernetes Dashboard:

 ```

 # kubectl apply -f https://raw.githubusercontent.com/kubernetes/dashboard/v2.7.0/aio/deploy/recommended.yaml
 # kubectl proxy

 Dashboard available at http://localhost:8001/api/v1/namespaces/kubernetes-dashboard/services/https:kubernetes-dashboard:/proxy/
 ```

## Как запустить проект:

 ```
    terraform apply -auto-approve=true
    terraform destroy -auto-approve=true

    ## kubectl config unset contexts.yc-test-cluster
    yc managed-kubernetes cluster get-credentials test-cluster --external

    kubectl apply -f dev-namespace.yml
    kubectl apply -f . -n dev

    kubectl describe service ui -n dev | grep NodePort
 ```

## Как проверить работоспособность:

http://84.201.173.23:31092/
http://62.84.126.114:31092/

## PR checklist
 - [+] Выставил label с темой домашнего задания
