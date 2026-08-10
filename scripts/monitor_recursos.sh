#!/bin/bash

export LC_ALL=C

LOG="$HOME/proyecto-monitor/logs/monitor.log"

CPU_LIMIT=80
RAM_LIMIT=80
DISK_LIMIT=90

FECHA=$(date '+%Y-%m-%d %H:%M:%S')

# =========================
# CPU
# =========================

CPU=$(mpstat 1 1 | awk '$1=="Average:" && $2=="all" {printf "%.0f", 100-$NF}')

# =========================
# RAM
# =========================

RAM=$(free | awk '/Mem:/ {printf "%.0f", ($3/$2)*100}')

# =========================
# DISCO
# =========================

DISK=$(df / | awk 'NR==2 {gsub("%","",$5); print $5}')

# Valores de seguridad
[ -z "$CPU" ] && CPU=0
[ -z "$RAM" ] && RAM=0
[ -z "$DISK" ] && DISK=0

ALERTA=""

# =========================
# CPU
# =========================

if [ "$CPU" -ge "$CPU_LIMIT" ]; then
    PROCESO_CPU=$(ps -eo pid,comm,%cpu --sort=-%cpu | head -n 2 | tail -n 1)
    ALERTA="${ALERTA}CPU alta: ${CPU}% - Proceso responsable: ${PROCESO_CPU}\n"
fi

# =========================
# RAM
# =========================

if [ "$RAM" -ge "$RAM_LIMIT" ]; then
    PROCESO_RAM=$(ps -eo pid,comm,%mem --sort=-%mem | head -n 2 | tail -n 1)
    ALERTA="${ALERTA}RAM alta: ${RAM}% - Proceso responsable: ${PROCESO_RAM}\n"
fi

# =========================
# DISCO
# =========================

if [ "$DISK" -ge "$DISK_LIMIT" ]; then
    ALERTA="${ALERTA}Disco alto: ${DISK}% - Punto de montaje: /\n"
fi

# =========================
# GUARDAR LOG
# =========================

if [ -n "$ALERTA" ]; then
    echo "[$FECHA] ALERTA:" >> "$LOG"
    echo -e "$ALERTA" >> "$LOG"
fi
