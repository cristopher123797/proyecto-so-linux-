# Automatización con Cron

## Objetivo

Configurar Cron para ejecutar automáticamente los scripts del sistema.

## Monitoreo automático

El script de monitoreo se ejecuta cada minuto mediante la siguiente configuración:

```text
* * * * * /home/david/proyecto-monitor/scripts/monitor_recursos.sh
## Verificación

Para consultar las tareas programadas se utiliza:

```bash
crontab -l
La tarea se ejecuta automáticamente cada minuto y genera registros en el archivo logs/monitor.log.

Para verificar que Cron está funcionando:

systemctl status cron --no-pager

El servicio debe aparecer como active (running).

Para revisar los registros generados:

tail -n 10 logs/monitor.log

Estos registros permiten comprobar que el script se está ejecutando y detectar posibles alertas de CPU, memoria o disco.
