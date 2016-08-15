#!/bin/bash

export YANDEX_USER
export YANDEX_PASSWORD
export YANDEX_FOLDER

echo "User is $YANDEX_USER"
echo "Password is $YANDEX_PASSWORD"

# Generate token
yandex-disk token --password $YANDEX_PASSWORD $YANDEX_USER

# Run service
yandex-disk start --dir $YANDEX_FOLDER -D
