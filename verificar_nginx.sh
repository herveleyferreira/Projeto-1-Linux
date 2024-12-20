#!/bin/bash

#Var em que guarda o caminho para o diretorioem que o log sera salvo
LOG_DIR="/var/log/nginx"

#Var para os arquivos de log online e offline
LOG_ONLINE="$LOG_DIR/servico_online.log"
LOG_OFFLINE="$LOG_DIR/servico_offline.log"

#Para data e hora local
DATA_HORA=$(date '+%Y-%m-%d %H:%M:%S')

#Nome do servico
SERVICO="nginx"

#Var em que o status do atual do nginx é armazenado
STATUS=$(systemctl is-active $SERVICO)

#Condcional para verificar o status do serviço
if [ "$STATUS" == "active" ]; then
        ESTADO="ONLINE"
        MENSAGEM="O servico $SERVICO está ONLINE."
        LOG="$DATA_HORA | Serviço: $SERVICO | STATUS: $ESTADO | Mensagem: $MENSAGEM"
        #Escreve log no arquivo servico_online.log
        echo "$LOG" >> "$LOG_ONLINE"
        echo -e "\033[0;32m Online \033[0m"
else
        ESTADO="OFLLINE"
        MENSAGEM="O serviço $SERVICO está OFFLINE"
        LOG="$DATA_HORA | Serviço: $SERVICO | STATUS: $ESTADO | Mensagem: $MENSAGEM"
        #Escreve log no arquivo servico_offline.log
        echo "$LOG" >> "$LOG_OFFLINE"
        echo -e "\033[0;31m Offline \033[0m"
fi