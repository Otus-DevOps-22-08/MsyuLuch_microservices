# MsyuLuch_microservices
MsyuLuch microservices repository

Status of Last Deployment: <br>
<img src="https://github.com/Otus-DevOps-22-08/MsyuLuch_microservices/actions/workflows/%20run-tests.yml/badge.svg"><br>

# Выполнено ДЗ № 18

 - [+] Основное ДЗ
 - [] Задание со *

## В процессе сделано:

 1. Создали новую ВМ и установили Docker

 2. Запустили GitLab, используя docker-compose.yml

```
    web:
      image: 'gitlab/gitlab-ce:latest'
      restart: always
      hostname: 'gitlab.example.com'
      environment:
        GITLAB_OMNIBUS_CONFIG: |
          external_url 'http://<YOUR-VM-IP>'
      ports:
        - '80:80'
        - '443:443'
        - '2222:22'
      volumes:
        - '/srv/gitlab/config:/etc/gitlab'
        - '/srv/gitlab/logs:/var/log/gitlab'
        - '/srv/gitlab/data:/var/opt/gitlab'

```

 3. Авторизовались в GitLab, создали новую группу и проект `homework/example`

 4. Добавили и зарегистрировали Runner

 5. Добавили в репозиторий приложение `reddit`. В корень добавили файл `.gitlab-ci.yml` для определения пайплайна:

 ```
        image: ruby:2.4.2

        stages:
          - build
          - test
          - review
          - stage
          - production

        variables:
          DATABASE_URL: 'mongodb://mongo/user_posts'

        before_script:
          - cd reddit
          - bundle install

        build_job:
          stage: build
          script:
            - echo 'Building'

        test_unit_job:
          stage: test
          services:
            - mongo:latest
          script:
            - ruby simpletest.rb

        test_integration_job:
          stage: test
          script:
            - echo 'Testing 2'

        deploy_dev_job:
          stage: review
          script:
            - echo 'Deploy'
          environment:
            name: dev
            url: http://dev.example.com

        branch review:
        stage: review
        script: echo "Deploy to $CI_ENVIRONMENT_SLUG"
        environment:
            name: branch/$CI_COMMIT_REF_NAME
            url: http://$CI_ENVIRONMENT_SLUG.example.com
        only:
            - branches
        except:
            - master

        staging:
          stage: stage
          when: manual
          only:
            - /^\d+\.\d+\.\d+/
          script:
            - echo 'Deploy'
          environment:
            name: beta
            url: http://beta.example.com

        production:
          stage: production
          when: manual
          script:
            - echo 'Deploy'
          environment:
            name: production
            url: http://example.com

 ```

 6. Проверили работу всех тестов и пайплайна

 7. Настроили уведомления в Slack

 [img](https://github.com/Otus-DevOps-22-08/MsyuLuch_microservices/tree/gitlab-ci-1/gitlab-ci/image.jpg)

## Как запустить проект:


## Как проверить работоспособность:

  - VM в Yandex Cloud с развернутым приложением:

    http://51.250.69.206/

## PR checklist
 - [+] Выставил label с темой домашнего задания
