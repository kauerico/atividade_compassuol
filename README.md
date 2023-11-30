# Atividade Linux 
Repositório para a primeira atividade de Linux e AWS , do programa de bolsas da Compass UOL.

**Objetico geral**: Criar uma instância EC2 e configurar o NFS para o armazenamento de arquivos. 

**Passos**: Gerar uma chave pública para acesso ao ambiente, criar uma instância EC2 com sistema operacional Amazon Linux 2, gerar 1 elastic IP e anexar à instância EC2, liberar as portas de comunicação, Configuração do NFS, criar um diretório com meu nome dentro dos arquivos do NFS, configurar um apache e subir ele, criação script para validar se o apache está funcionando ou não e mandar o resultado para o diretório NFS, e automatizar esse script para rodar de 5 em 5 minutos.

## Requisitos

### Configurações instancia AWS:
- Chave pública para acesso ao ambiente
- Amazon Linux 2
    - t3.small
    - 16 GB SSD
- 1 Elastic IP associado a instancia
- Portas de comunicação liberadas
    - 22/TCP (SSH)
    - 111/TCP e UDP (RPC)
    - 2049/TCP/UDP (NFS)
    - 80/TCP (HTTP)
    - 443/TCP (HTTPS)

### Configurações Linux:

- Configurar o NFS entregue;
- Criar um diretorio dentro do filesystem do NFS com seu nome;
- Subir um apache no servidor - o apache deve estar online e rodando;
- Criar um script que valide se o serviço esta online e envie o resultado da validação para o seu diretorio no nfs;
    - O script deve conter - Data HORA + nome do serviço + Status + mensagem personalizada de ONLINE ou offline;
    - O script deve gerar 2 arquivos de saida: 1 para o serviço online e 1 para o serviço OFFLINE;
    - Execução automatizada do script a cada 5 minutos.
    - 
### Configurar o NFS com o IP fornecido

- Criar um novo diretório para o NFS usando o comando `sudo mkdir /srv/nfs`.
- Montar o NFS no diretório criado usando o comando `sudo mount IP_OU_DNS_DO_NFS:/ /srv/nfs`.
- Verificar se o NFS foi montado usando o comando `df -h`.
- Configurar o NFS para montar automaticamente no boot usando o comando `sudo nano /etc/fstab`.
- Adicionar a seguinte linha no arquivo `/etc/fstab`:
    ```
    IP_OU_DNS_DO_NFS:/ /mnt/nfs nfs defaults 0 0
    ```
- Salvar o arquivo `/etc/fstab`.
- Criar um novo diretório para o usuário kaue usando o comando `sudo mkdir /srv/nfs/kaue`.

### Configurar o Apache.

- Executar o comando `sudo yum update -y` para atualizar o sistema.
- Executar o comando `sudo yum install httpd -y` para instalar o apache.
- Executar o comando `sudo systemctl start httpd` para iniciar o apache.
- Executar o comando `sudo systemctl enable httpd` para habilitar o apache para iniciar automaticamente.
- Executar o comando `sudo systemctl status httpd` para verificar o status do apache.
- Configurações adicionais do apache podem ser feitas no arquivo `/etc/httpd/conf/httpd.conf`.
- para parar o apache, executar o comando `sudo systemctl stop httpd`.

  ### Configurar o Apache.

- Executar o comando `sudo yum update -y` para atualizar o sistema.
- Executar o comando `sudo yum install httpd -y` para instalar o apache.
- Executar o comando `sudo systemctl start httpd` para iniciar o apache.
- Executar o comando `sudo systemctl enable httpd` para habilitar o apache para iniciar automaticamente.
- Executar o comando `sudo systemctl status httpd` para verificar o status do apache.
- Configurações adicionais do apache podem ser feitas no arquivo `/etc/httpd/conf/httpd.conf`.
- para parar o apache, executar o comando `sudo systemctl stop httpd`.**

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

- Salve o arquivo de script.
- Execute o comando `chmod +x script.sh` para tornar o arquivo de script executável.
- Execute o comando `./script_monitoramento.sh` para executar o script.

### Configurar a execução do script de validação a cada 5 minutos.
### Configurar o cronjob.

- Execute o comando `crontab -e` para editar o cronjob.
- Adicione a seguinte linha de código no arquivo de cronjob:
    ```bash
    */5 * * * * /home/ec2-user/script_monitoramento.sh
    ```
- Salve o arquivo de cronjob.
- Execute o comando `crontab -l` para verificar se o cronjob foi configurado corretamente.

### Versionamento Git/GitHub
- git clone https://github.com/nome-de-usuario/nome-do-repositorio.git
- git add .
- git commit -m "Adiciona arquivos iniciais"
- git push origin master
