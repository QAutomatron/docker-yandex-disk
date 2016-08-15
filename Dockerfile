FROM phusion/baseimage:0.9.19
MAINTAINER QAutomatron

# Default variables
ENV YANDEX_FOLDER = "/var/lib/selenium"

# Will install yandex-disk
echo "deb http://repo.yandex.ru/yandex-disk/deb/ stable main" | sudo tee -a /etc/apt/sources.list.d/yandex.list > /dev/null && wget http://repo.yandex.ru/yandex-disk/YANDEX-DISK-KEY.GPG -O- | sudo apt-key add - && sudo apt-get update && sudo apt-get install -y yandex-disk

# Will create folder
RUN mkdir $YANDEX_FOLDER

# Folder to mount
VOLUME ["$YANDEX_FOLDER"]

# Copy start script
COPY start.sh /
RUN chmod +x /start.sh

CMD ["/start.sh"]
