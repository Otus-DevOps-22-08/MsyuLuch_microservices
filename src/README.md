# MsyuLuch_microservices
MsyuLuch microservices repository

Status of Last Deployment: <br>
<img src="https://github.com/Otus-DevOps-22-08/MsyuLuch_microservices/actions/workflows/%20run-tests.yml/badge.svg"><br>

# Выполнено ДЗ № 14

 - [+] Основное ДЗ
 - [] Задание со *

## В процессе сделано:

 1. Разбили приложение на несколько микросервисов `post-py`, `comment`, `ui`

 2. Все действия выполняем на удаленном хосте (docker-host). Собрали образы с описанными ранее микросервисами.

 3. Создали сеть для работы приложения, volume для хранения данных приложения:

 ```
 docker network create reddit

 docker volume create reddit_db
 ```

 4. Адреса для взаимодействия контейнеров задаются через ENV - переменные внутри Dockerfile 'ов,
 которые можно изменить передав в командной строке параметр `-e`:

 ```
   $ docker run -d --network=reddit --network-alias=postext_db --network-alias=comment_db -v reddit_db:/data/db mongo:latest

   $ docker run -d --network=reddit --network-alias=postext -e POST_DATABASE_HOST='post_db' -e POST_DATABASE='posts' 123344555/post:1.0

   $ docker run -d --network=reddit --network-alias=commentext -e COMMENT_DATABASE_HOST='comment_db' -e COMMENT_DATABASE='comments' 123344555/comment:1.0

   $ docker run -d --network=reddit -p 9292:9292 -e POST_SERVICE_HOST='posts' -e COMMENT_SERVICE_HOST='comments' 123344555/ui:1.0

 ```

 5. Внесены корректировки в Dockerfile каждого микросервиса для оптимизации образа, новый сохранен как `Dockerfile.1`

 6. В файл `.github/.pre-commit-config.yaml` добавлены проверки

      ```
      ## Проверки файлов hadolint
      - repo: https://github.com/hadolint/hadolint.git
         rev: v2.12.0
         hooks:
            - id: hadolint-docker
               entry: hadolint/hadolint:v2.12.0 hadolint
      ```

## Как запустить проект:

```
   $ docker run -d --network=reddit --network-alias=post_db --network-alias=comment_db -v reddit_db:/data/db mongo:latest

   $ docker run -d --network=reddit --network-alias=post 123344555/post:1.0

   $ docker run -d --network=reddit --network-alias=comment 123344555/comment:1.0

   $ docker run -d --network=reddit -p 9292:9292 123344555/ui:2.0

```

## Как проверить работоспособность:

  - Docker хост в Yandex Cloud с развернутым приложением:

    http://51.250.6.169:9292/

## PR checklist
 - [+] Выставил label с темой домашнего задания
