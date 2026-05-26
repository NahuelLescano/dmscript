help() {
  echo "Uso: $0 <archivo>"
  exit 1
}

archivo="$1"
if [ -z "$archivo" ]; then
  help
fi
dir=$(dirname -- "$archivo")

case "$archivo" in
*.tar.gz | *.tgz)
  tar -xzf "$archivo" -C "$dir"
  echo "Archivo descomprimido: $archivo"
  ;;
*.tar.bz2 | *.tbz2)
  tar -xjf "$archivo" -C "$dir"
  echo "Archivo descomprimido: $archivo"
  ;;
*.tar.xz | *.txz)
  tar -xJf "$archivo" -C "$dir"
  echo "Archivo descomprimido: $archivo"
  ;;
*.zip)
  unzip -d "$dir" "$archivo"
  echo "Archivo descomprimido: $archivo"
  ;;
*)
  echo "Formato de archivo no soportado."
  help
  ;;
esac
