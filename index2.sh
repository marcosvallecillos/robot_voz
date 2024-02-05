#!/bin/bash

    noticias = "https://www.marca.com/"
# Comprobar si wget está instalado, y si no, instalarlo
if ! command -v wget &> /dev/null; then
    echo "wget no está instalado. Instalando..."
    sudo apt-get install wget -y
    else
    echo "El comando wget esta instalado"
fi
# Descargar el código fuente HTML del portal de noticias
wget -O marca.html $noticias
# Extraer titulares con grep y awk (ajusta según la estructura del HTML)
grep -o '<h2 class="titulo">.*</h2>' noticias.html | awk -F"[<>]" '{print $3}' > titulares.txt