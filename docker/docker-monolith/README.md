# MsyuLuch_microservices
MsyuLuch microservices repository

Status of Last Deployment: <br>
<img src="https://github.com/Otus-DevOps-22-08/MsyuLuch_microservices/actions/workflows/run-tests.yml/badge.svg"><br>

# Выполнено ДЗ № 12, 13

 - [+] Основное ДЗ
 - [+] Задание со *

## В процессе сделано:

 1.  Установили Docker, проверили работу основных команд, запустили контейнер, создали образ из контейнера,
 описали разницу между образом и контейнером в файле `/docker-monolith/docker-1.log`

 2. Создадим Docker хост в Yandex Cloud и настроим локальное окружение на работу с ним

 3. Описали Dockerfile и собрали образ, который разворачивает приложение `reddit`

 4. Зарегистрировались на Docker hub и загрузили туда собранный образ

 5. В папке `Infra` автоматизировано поднятие инстанса в Yandex Cloud с помощью Terraform, образ сделан с Packer, добавлены плейбуки:

   Ansible playbook:

    - `ansible/playbooks/deploy.yml` - устанавливает приложение
    - `ansible/playbooks/packer_docker.yml` - устанавливает Docker

    ```
       $ packer build -var-file=packer/variables.hcl packer/docker-base.pkr.hcl
       $ docker-monolith/infra/terraform/stage/terraform apply -auto-approve
       $ ansible-playbook playbooks/deploy.yml
    ```
## Как запустить проект:

```
   $ docker run --name reddit -d -p 9292:9292 123344555/otus-reddit:1.0
```

## Как проверить работоспособность:

  - Docker хост в Yandex Cloud с развернутым приложением:

    http://158.160.38.24:9292/

## PR checklist
 - [+] Выставил label с темой домашнего задания
