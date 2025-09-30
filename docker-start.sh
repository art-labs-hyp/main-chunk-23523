#!/usr/bin/env bash
set -e

# Render, container içinde $PORT çevre değişkenini verir.
PORT="${PORT:-10000}"

# Apache'yi bu porta dinleyecek şekilde ayarla
sed -ri "s/Listen 80/Listen ${PORT}/g" /etc/apache2/ports.conf
sed -ri "s/:80>/:${PORT}>/g" /etc/apache2/sites-available/000-default.conf

# Sunucuyu foreground'da çalıştır
exec apache2-foreground
