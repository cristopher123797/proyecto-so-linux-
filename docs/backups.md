# Sistema Automatizado de Respaldos

## Descripción
Se desarrolló un script en Bash (`scripts/backup_db.sh`) que automatiza el respaldo de la base de datos `restaurante_db`.

## Funcionamiento
1. Define la carpeta de destino: `/home/vboxuser/backups`
2. Verifica si la carpeta existe; si no, la crea automáticamente
3. Genera el respaldo con `mysqldump`, incluyendo fecha y hora en el nombre del archivo (formato: `backup_db_YYYY-MM-DD_HH-MM.sql`)
4. Comprime el respaldo con `gzip`, quedando como `.sql.gz`

## Ejecución manual
chmod +x scripts/backup_db.sh
sudo bash scripts/backup_db.sh


## Verificación
Se comprobó la creación correcta del respaldo con:
ls -lh ~/backups/
Resultado: archivo `backup_db_2026-08-09_07-24.sql.gz` generado correctamente.

## Evidencias
![Script ejecutado y respaldo generado](evidencias/backup_ejecutado.png)
