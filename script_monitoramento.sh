#!/bin/bash

# Defina as variáveis
servico="httpd"  # Substitua "apache2" pelo nome real do seu serviço
diretorio_nfs="/srv/nfs/kaue"
data_hora=$(date '+%d-%m-%y %H:%M:%S')
arquivo_online="$diretorio_nfs/servico_online.txt"
arquivo_offline="$diretorio_nfs/servico_offline.txt"

# Verifique a conectividade com o serviço (altere para o comando relevante para o seu caso)
if systemctl is-active --quiet $servico; then
    status="ONLINE"
    mensagem="O serviço está online."
    arquivo_saida=$arquivo_online
else
    status="OFFLINE"
    mensagem="O serviço está offline."
    arquivo_saida=$arquivo_offline
fi

# Crie a mensagem formatada
mensagem_formatada="$data_hora - $servico - Status: $status - $mensagem"

# Imprima a mensagem no console
echo $mensagem_formatada

# Salve a mensagem no arquivo correspondente
echo $mensagem_formatada >> $arquivo_saida



