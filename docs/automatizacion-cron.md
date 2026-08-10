# Automatización con Cron

## Objetivo

Configurar Cron para ejecutar automáticamente los scripts del proyecto y evitar tener que ejecutarlos manualmente.

## Cron del sistema de monitoreo

El script de monitoreo se ejecuta cada minuto mediante la siguiente configuración:

```text
* * * * * /home/david/proyecto-monitor/scripts/monitor_recursos.sh
Esta tarea permite revisar periódicamente el uso de los recursos del sistema.

## Cron del respaldo

El script de respaldo se programa para ejecutarse cada 12 horas:

```text
0 */12 * * * /home/david/proyecto-monitor/scripts/backup_db.sh
