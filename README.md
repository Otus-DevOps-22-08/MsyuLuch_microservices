# MsyuLuch_microservices
MsyuLuch microservices repository

Status of Last Deployment: <br>
<img src="https://github.com/Otus-DevOps-22-08/MsyuLuch_microservices/actions/workflows/%20run-tests.yml/badge.svg"><br>

# Выполнено ДЗ № 17

 - [+] Основное ДЗ
 - [] Задание со *

## В процессе сделано:

 1. Обновили версии всех сервисов: post, ui, comment. Собрали новые образы с тегом `logging` и загрузили на DockerHub

 2. Создали новую docker-machine для запуска проекта с логгированием

 3. Создали отдельный `docker/docker-compose-logging.yml,` включающий в себя стэк: ElasticSearch (для храннения логов), Kibana (для визуализации), Fluentd (для сбороа логов)

 4. Собрали образ Fluentd, исходники находятся в директории `logging/fluentd/Dockerfile`. Конфигурационный файл `logging/fluentd/fluent.conf` включает описание основных параметров для сбора логов и отправки их дальше для хранения в ElasticSearch. Так же в файл добавлены фильтры для сортировки информации по сервисам (структурирование логов). Для облегчения задачи парсинга вместо стандартных регулярок были использованы grok-шаблоны.

 ```
  #  cd logging/fluentd
  #  docker build -t $USER_NAME/fluentd .
 ```

 ```
    …
    <filter service.ui>
    @type parser
    format grok
    grok_pattern %{RUBY_LOGGER}
    key_name log
    </filter>
    …
 ```

 5. В описание сервисов добавили опции для сбора логов

 ```
      …
      post:
      …
      logging:
      driver: "fluentd"
      options:
      fluentd-address: localhost:24224
      tag: service.post

      ui:
      …
      logging:
      driver: "fluentd"
      options:
      fluentd-address: localhost:24224
      tag: service.ui
      …

 ```

 6. Добавили новый сервис для распределенного трекинга Zipkin:

 ```
    services:
      zipkin:
        image: openzipkin/zipkin:2.21.0
        ports:
        - "9411:9411"
 ```

 7. Для сервисов приложения добавили параметр:

 ```
    environment:
      - ZIPKIN_ENABLED=${ZIPKIN_ENABLED}
 ```

## Как запустить проект:

```
  # cd docker && docker-compose up -d
  # docker-compose -f docker-compose-logging.yml up -d
```

## Как проверить работоспособность:

  - Docker хост в Yandex Cloud с развернутым приложением:

    http://51.250.91.120:9292/
    http://51.250.91.120:5601/
    http://51.250.91.120:9411/

## PR checklist
 - [+] Выставил label с темой домашнего задания
