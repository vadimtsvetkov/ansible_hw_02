# Домашнее задание к занятию 2 «Работа с Playbook»

## Основная часть

#### 1. Подготовьте свой inventory-файл `prod.yml`.
#### 2. Допишите playbook: нужно сделать ещё один play, который устанавливает и настраивает [vector](https://vector.dev). Конфигурация vector должна деплоиться через template файл jinja2.
#### 3. При создании tasks рекомендую использовать модули: `get_url`, `template`, `unarchive`, `file`.
#### 4. Tasks должны: скачать дистрибутив нужной версии, выполнить распаковку в выбранную директорию, установить vector.
#### 5. Запустите `ansible-lint site.yml` и исправьте ошибки, если они есть.
#### 6. Попробуйте запустить playbook на этом окружении с флагом `--check`.

<details>
<summary>Вывод консоли:</summary>

```sh
[tvadim@localhost playbook]$ ansible-playbook -i inventory/prod.yml site.yml --check

PLAY [Install Clickhouse] ******************************************************

TASK [Gathering Facts] *********************************************************
ok: [clickhouse-01]

TASK [Get clickhouse distrib] **************************************************
ok: [clickhouse-01] => (item=clickhouse-client)
ok: [clickhouse-01] => (item=clickhouse-server)
ok: [clickhouse-01] => (item=clickhouse-common-static)

TASK [Install clickhouse packages] *********************************************
ok: [clickhouse-01]

TASK [Create database] *********************************************************
skipping: [clickhouse-01]

PLAY [Install Vector] **********************************************************

TASK [Gathering Facts] *********************************************************
ok: [clickhouse-02]

TASK [Download vector packages] ************************************************
ok: [clickhouse-02]

TASK [Install vector packages] *************************************************
ok: [clickhouse-02]

TASK [Apply vector template] ***************************************************
ok: [clickhouse-02]

TASK [Change vector systemd unit] **********************************************
ok: [clickhouse-02]

PLAY RECAP *********************************************************************
clickhouse-01              : ok=3    changed=0    unreachable=0    failed=0    skipped=1    rescued=0    ignored=0   
clickhouse-02              : ok=5    changed=0    unreachable=0    failed=0    skipped=0    rescued=0    ignored=0 
```   
</details>

#### 7. Запустите playbook на `prod.yml` окружении с флагом `--diff`. Убедитесь, что изменения на системе произведены.

<details>
<summary>Вывод консоли:</summary>

```sh
[tvadim@localhost playbook]$ ansible-playbook -i inventory/prod.yml site.yml --diff

PLAY [Install Clickhouse] ******************************************************

TASK [Gathering Facts] *********************************************************
ok: [clickhouse-01]

TASK [Get clickhouse distrib] **************************************************
ok: [clickhouse-01] => (item=clickhouse-client)
ok: [clickhouse-01] => (item=clickhouse-server)
ok: [clickhouse-01] => (item=clickhouse-common-static)

TASK [Install clickhouse packages] *********************************************
ok: [clickhouse-01]

TASK [Create database] *********************************************************
ok: [clickhouse-01]

PLAY [Install Vector] **********************************************************

TASK [Gathering Facts] *********************************************************
ok: [clickhouse-02]

TASK [Download vector packages] ************************************************
ok: [clickhouse-02]

TASK [Install vector packages] *************************************************
ok: [clickhouse-02]

TASK [Apply vector template] ***************************************************
ok: [clickhouse-02]

TASK [Change vector systemd unit] **********************************************
ok: [clickhouse-02]

PLAY RECAP *********************************************************************
clickhouse-01              : ok=4    changed=0    unreachable=0    failed=0    skipped=0    rescued=0    ignored=0   
clickhouse-02              : ok=5    changed=0    unreachable=0    failed=0    skipped=0    rescued=0    ignored=0
```   
</details>

#### 8. Повторно запустите playbook с флагом `--diff` и убедитесь, что playbook идемпотентен.

<details>
<summary>Вывод консоли:</summary>

```sh
[tvadim@localhost playbook]$ ansible-playbook -i inventory/prod.yml site.yml --diff

PLAY [Install Clickhouse] ******************************************************

TASK [Gathering Facts] *********************************************************
ok: [clickhouse-01]

TASK [Get clickhouse distrib] **************************************************
ok: [clickhouse-01] => (item=clickhouse-client)
ok: [clickhouse-01] => (item=clickhouse-server)
ok: [clickhouse-01] => (item=clickhouse-common-static)

TASK [Install clickhouse packages] *********************************************
ok: [clickhouse-01]

TASK [Create database] *********************************************************
ok: [clickhouse-01]

PLAY [Install Vector] **********************************************************

TASK [Gathering Facts] *********************************************************
ok: [clickhouse-02]

TASK [Download vector packages] ************************************************
ok: [clickhouse-02]

TASK [Install vector packages] *************************************************
ok: [clickhouse-02]

TASK [Apply vector template] ***************************************************
ok: [clickhouse-02]

TASK [Change vector systemd unit] **********************************************
ok: [clickhouse-02]

PLAY RECAP *********************************************************************
clickhouse-01              : ok=4    changed=0    unreachable=0    failed=0    skipped=0    rescued=0    ignored=0   
clickhouse-02              : ok=5    changed=0    unreachable=0    failed=0    skipped=0    rescued=0    ignored=0
```   
</details>

#### 9. Подготовьте README.md-файл по своему playbook. В нём должно быть описано: что делает playbook, какие у него есть параметры и теги. Пример качественной документации ansible playbook по [ссылке](https://github.com/opensearch-project/ansible-playbook).
#### 10. Готовый playbook выложите в свой репозиторий, поставьте тег `08-ansible-02-playbook` на фиксирующий коммит, в ответ предоставьте ссылку на него.

---

### Как оформить решение задания

Выполненное домашнее задание пришлите в виде ссылки на .md-файл в вашем репозитории.

---