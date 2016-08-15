FROM phusion/baseimage:0.9.19
MAINTAINER QAutomatron

# Default variables
ENV yandex_pass=pass
ENV yandex_user=user

# Will install yandex-disk
echo "deb http://repo.yandex.ru/yandex-disk/deb/ stable main" | sudo tee -a /etc/apt/sources.list.d/yandex.list > /dev/null && wget http://repo.yandex.ru/yandex-disk/YANDEX-DISK-KEY.GPG -O- | sudo apt-key add - && sudo apt-get update && sudo apt-get install -y yandex-disk

# Will create folder
RUN mkdir /var/lib/yandex-disk

# Folder to mount
VOLUME ["/var/lib/selenium"]
