# MsyuLuch_microservices
MsyuLuch microservices repository

Status of Last Deployment: <br>
<img src="https://github.com/Otus-DevOps-22-08/MsyuLuch_microservices/actions/workflows/%20run-tests.yml/badge.svg"><br>

# Выполнено ДЗ № 16

 - [+] Основное ДЗ
 - [] Задание со *

## В процессе сделано:

 1. Собрали образ `Prometheus`, исходники находятся в папке `monitoring\prometheus`.
 Конфигурационный файл `prometheus.yml` включает в себя следующие цели для сбора метрик:

 ```
  - job_name: 'node'
    static_configs:
      - targets:
        - 'node-exporter:9100'

  - job_name: 'mongo'
    static_configs:
      - targets:
        - 'mongodb-exporter:9216'

  - job_name: 'blackbox'
    metrics_path: /probe
        params:
          module: [http_2xx]
        static_configs:
          - targets:
            - 'ui:9292'
            - 'comment:9292/healthcheck'
            - 'post:5000/posts'
    relabel_configs:
            replacement: blackbox-exporter:9115
 ```

 2. Образы залиты на DockeHub

 ```
 https://hub.docker.com/repository/docker/123344555/prometheus
 https://hub.docker.com/repository/docker/123344555/post
 https://hub.docker.com/repository/docker/123344555/comment
 https://hub.docker.com/repository/docker/123344555/ui
 ```

 3. В `docker-compose.yml` добавили сервисов:

 ```
  prometheus:
    build: ./prometheus
    image:  ${USERNAME}/prometheus:${PROMETHEUS_VERSION}

  node-exporter:
    image: prom/node-exporter:v0.15.2
    user: root

  blackbox-exporter:
    image: bitnami/blackbox-exporter:0.23.0
    ports:
      - '9115:9115'

  mongo-exporter:
    image: bitnami/mongodb-exporter:0.36.0
    command:
      - '--mongodb.uri=mongodb://post_db'
      - '--collect-all'
 ```

## Как запустить проект:

```
   $ docker-compose up -d
   $ docker-compose ps
```

## Как проверить работоспособность:

  - Docker хост в Yandex Cloud с развернутым приложением:

    http://51.250.6.169:9292/
    http://51.250.6.169:9090/

## PR checklist
 - [+] Выставил label с темой домашнего задания
