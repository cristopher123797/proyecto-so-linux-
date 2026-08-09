#!/bin/bash

# Script de respaldo automatico de la base de datos restaurante_db

BACKUP_DIR="/home/vboxuser/backups"
FECHA=$(date +%Y-%m-%d_%H-%M)
ARCHIVO="backup_db_${FECHA}.sql"
DB_NAME="restaurante_db"

# Verificar si la carpeta de backups existe, si no, crearla
if [ ! -d "$BACKUP_DIR" ]; then
    mkdir -p "$BACKUP_DIR"
    echo "Carpeta de backups creada en $BACKUP_DIR"
fi

# Respaldar la base de datos
mysqldump -u root "$DB_NAME" > "$BACKUP_DIR/$ARCHIVO"

# Comprimir el respaldo
gzip "$BACKUP_DIR/$ARCHIVO"

echo "Respaldo completado: $BACKUP_DIR/${ARCHIVO}.gz"
