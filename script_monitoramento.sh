servico="httpd"  
diretorio_nfs="/srv/nfs/kaue"
data_hora=$(date '+%d-%m-%y %H:%M:%S')
arquivo_online="$diretorio_nfs/servico_online.txt"
arquivo_offline="$diretorio_nfs/servico_offline.txt"

if systemctl is-active --quiet $servico; then
    status="ONLINE"
    mensagem="O serviço está online."
    arquivo_saida=$arquivo_online
else
    status="OFFLINE"
    mensagem="O serviço está offline."
    arquivo_saida=$arquivo_offline
fi
mensagem_formatada="$data_hora - $servico - Status: $status - $mensagem"

echo $mensagem_formatada

echo $mensagem_formatada >> $arquivo_saida



