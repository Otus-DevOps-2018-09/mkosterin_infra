# mkosterin_infra
mkosterin Infra repository

Домашнее задание №5
Обязательная часть:
Создан шаблон, содержащие базовые компоненты для приложения;
json шаблон packera сделан параметрическим;
Изучена тема provisioner типа shell, file;
Повторно использованы скрипты деплоя приложений;
Создана тестовая машина из шаблона, на ней вручную развернуто приложение;
Самостотельные задания:
Добавлены параметры в шаблон;
Создан файл переменных;
Изучены дополнительные параметры в шаблонах
На основе базового шаблона создан полный шаблон, в котором задеплоено приложение;
Написан systemd unit файл, организована его доставка в шаблон;
Написан скрипт, разворачивающий виртульную машину из полного шаблона.



Домашнее задание №4
Команда для автоматического деплоя приложения:
gcloud compute instances create reddit-app \
--boot-disk-size=10GB \
--image-family ubuntu-1604-lts \
--image-project=ubuntu-os-cloud \
--machine-type=g1-small \
--tags puma-server \
--restart-on-failure \
--metadata-from-file startup-script=startup.sh

Команда для создания правила в Брэндмауэре:
gcloud compute firewall-rules create default-puma-server \
--allow tcp:9292 \
--source-ranges 0.0.0.0/0 \
--target-tags puma-server

testapp_IP = 35.231.128.85
testapp_port = 9292



Домашнее задание №3

Самостоятельное задание №1. Для подключения к хосту, не имеющего внешнего IP адреса через промежуточный сервер,
используя SSH Forwarding в одну команду используем возможность интерактивного запуска команд, после присоединения к серверу:
ssh -t -i ~/.ssh/oper -A oper@ext_IP_of_bastion 'ssh int_IP_of_something_server'
Ключ -t важен, без него не будет интерактивного режима.

Самостоятельное задание №2. Подключение к хосту не имеющего внешних связей через bastion одной командой вида 'ssh someinternalhost'.
Для решения данной задачи создадим локальный конфиг ssh клиента пользователя. Путь к файлу:
~/.ssh/config
Внутри создадим alias вида:
Host someinternalhost
  HostName 35.211.213.113
  Port 22
  User oper
  IdentityFile ~/.ssh/oper
  ForwardAgent yes
  RemoteCommand ssh 10.142.0.3
  RequestTTY force

После такой настройки команда 'ssh someinternalhost' будет заводить нас на сервер 10.142.0.3 через bastion без дополнительных
движений и вопросов.


bastion_IP = 35.211.213.113
someinternalhost_IP = 10.142.0.2

