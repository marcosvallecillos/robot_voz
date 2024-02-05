#!/bin/bash

    noticias = "https://www.marca.com/"
# Comprobar si wget está instalado, y si no, instalarlo
if ! command -v wget &> /dev/null; then
    echo "wget no está instalado. Instalando..."
    sudo apt-get install wget -y
    else
    echo "El comando wget esta instalado"
fi