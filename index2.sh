#!/bin/bash
noticias="https://www.marca.com/"
archivo_html="Marca.html"

# Verificación de que el comando wget o curl está en el sistema
if ! command -v wget &> /dev/null; then
    echo "wget no está instalado. Instalando..."
    apt-get update
    apt-get install -y wget 
else
    echo "El comando wget ya está instalado"
fi 

# Reemplazar caracteres codificados con sus equivalentes utilizando iconv
iconv -f ISO-8859-1 -t UTF-8 "$archivo_html" > "$archivo_html.tmp" && mv "$archivo_html.tmp" "$archivo_html"

# Descargar el código fuente HTML del portal de noticias
wget -O marca.html $noticias
# Extraer titulares con grep y awk (ajusta según la estructura del HTML)
grep -o '<h2 class="titulo">.*</h2>' noticias.html | awk -F"[<>]" '{print $3}' > titulares.txt

# Pasar archivo .txt al sintetizador tts (espeak, festival...) verificando previamente
# que el comando está instalado y, si no lo está, instalándolo.
if ! command -v espeak &> /dev/null; then
    echo "espeak no está instalado. Instalando..."
    apt-get update
    apt-get install -y espeak 
fi
