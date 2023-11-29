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
      




  
