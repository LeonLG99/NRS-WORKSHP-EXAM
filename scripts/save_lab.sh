#!/bin/bash

LAB_DIR="/root/LABS/clab-NRS-II-WORKSHOP-TRAINNING"
DEST_DIR="configs"

echo "Respaldando configuraciones de $LAB_DIR..."
mkdir -p "$DEST_DIR"

# Busca config.cfg o config.txt sin requerir paréntesis
find "$LAB_DIR" -type f -name "config.cfg" -o -type f -name "config.txt" | while read -r r; do
    # Extrae el nombre del router (la carpeta inmediatamente después de clab-NRS-II-WORKSHOP-TRAINNING/)
    rel_path="${r#$LAB_DIR/}"
    router="${rel_path%%/*}"

    cp "$r" "$DEST_DIR/${router}.cfg"
    echo "Guardado: $DEST_DIR/${router}.cfg (desde $r)"
done

echo ""
echo "Cambios detectados por Git:"
git status
