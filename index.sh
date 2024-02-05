#!/bin/sh

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

# Descarga del sitio web elegido (obtención del "index.html") mediante wget
wget -O "$archivo_html" "$noticias"

# Reemplazar caracteres codificados con sus equivalentes utilizando iconv
iconv -f ISO-8859-1 -t UTF-8 "$archivo_html" > "$archivo_html.tmp" && mv "$archivo_html.tmp" "$archivo_html"

# Extraer de ese "index.html" la información de interés (titulares, etc.) y nos la
# llevaríamos a un archivo propio .txt
cat Marca.html | grep -o \<h2.\<\\h2 | sed 's/<[^>]>//g' > titulares.txt
cat titulares.txt

# Pasar archivo .txt al sintetizador tts (espeak, festival...) verificando previamente
# que el comando está instalado y, si no lo está, instalándolo.
if ! command -v espeak &> /dev/null; then
    echo "espeak no está instalado. Instalando..."
    apt-get update
    apt-get install -y espeak 
fi



# FIN!!