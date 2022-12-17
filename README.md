# MsyuLuch_microservices
MsyuLuch microservices repository

Status of Last Deployment: <br>
<img src="https://github.com/Otus-DevOps-22-08/MsyuLuch_microservices/actions/workflows/%20run-tests.yml/badge.svg"><br>

# Выполнено ДЗ № 15

 - [+] Основное ДЗ
 - [] Задание со *

## В процессе сделано:

 1. Изучили сети в Docker

 2. Познакомились с Docker Compose

 3. Перенесли все сервисы в файл `docker-compose.yml`

 4. Добавили использование нескольких сетей, сетевых алиасов, а так же параметризовали перенные в файле `.env`:

 ```
 post_db:
    image: mongo:${MONGO_VERSION}
    volumes:
      - post_db:/data/db
    networks:
      back_net:
        aliases:
          - post_db
          - comment_db
    env_file:
      - .env
 ```

 ```
      MONGO_VERSION=4.2
      UI_VERSION=3.0
      POST_VERSION=3.0
      COMMENT_VERSION=2.0

      HOST_PORT=9292
      PORT=9292
 ```

 5. Изменить базовое имя проекта можно с помощью переменной среды `COMPOSE_PROJECT_NAME` в файле `.env`  (https://docs.docker.com/compose/reference/envvars/):

 ```

 COMPOSE_PROJECT_NAME=myapp

 ```
 6. Добавили файл переопределения конфигурации `docker-compose.override.yml`, дополнительно примонтировали каталоги с исходным кодом:

 ```

version: '3.9'
services:
  ui:
    volumes:
      - ./ui:/app
  post:
    volumes:
      - ./post-py:/app
  comment:
    volumes:
      - ./comment:/app
 ```

## Как запустить проект:

```
   $ docker-compose up -d

   $ docker-compose ps
```

## Как проверить работоспособность:

  - Docker хост в Yandex Cloud с развернутым приложением:

    http://51.250.6.169:9292/

## PR checklist
 - [+] Выставил label с темой домашнего задания
