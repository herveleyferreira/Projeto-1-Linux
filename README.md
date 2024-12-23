# ATIVIDADE PRÁTICA 1 -TRILHA DEVSECOPS COMPASS UOL

## _Projeto prático realizado no programa de bolsas Compass UOL na trilha de DevSecOps_

## Índice

1. [Pré-requisitos](#pré-requisitos)  

2. [Objetivos](#objetivos)  
   - [Instalar o WSL e o Ubuntu 22.04 LTS](#instalar-o-wsl-e-o-ubuntu-2204-lts)  
   - [Subir um servidor NGINX](#subir-um-servidor-nginx)  
   - [Crie um script de monitoramento do NGINX](#crie-um-script-de-monitoramento-do-nginx)  
   - [Automatizar a execução do script](#automatizar-a-execução-do-script)  
   - [Fazer versionamento e documentação do projeto através do Github](#fazer-versionamento-e-documentação-do-projeto-atraves-do-github)  

3. [Passo a Passo](#passo-a-passo)  
   3.1. [Ativar o WSL no Windows](#ativar-o-wsl-no-windows)  
   3.2. [Instalar o Ubuntu](#instalar-o-ubuntu)  
   3.3. [Instalar o servidor NGINX no Ubuntu](#instalar-o-servidor-nginx-no-ubuntu)  
   3.4. [Criar script para verificação de status do NGINX](#criar-script-para-verificação-de-status-do-nginx)  
   3.5. [Executar o script](#executar-o-script)  
   3.6. [Automatizar a execução do script](#automatizar-a-execução-do-script)    
      3.6.1. [Adicionar linha ao crontab](#adicionar-linha-ao-crontab)  
      3.6.2. [Explicação da sintaxe](#explicação-da-sintaxe)  

4. [Resultado](#resultado)  
   4.1. [Logs quando o sistema está online](#logs-quando-o-sistema-está-online)  
   4.2. [Logs quando o sistema está offline](#logs-quando-o-sistema-está-offline)  


## 1. Pré-Requisitos:
-   Windows;
-   Unbutu LTS 20.04 ou superior;
-   WSL.

## 2. Objetivos:
- __Instalar o WSL e o Ubuntu 22.04 LTS__ : Configure o ambiente Linux em um sistema operacional Windows utilizando o Windows Subsystem for Linux (WSL), garantindo a funcionalidade e acessibilidade ao terminal.
- __Subir um servidor NGINX__ : Instale, configure e garanta que o servidor web NGINX esteja online e funcionando corretamente no ambiente Linux.
- __Crie um script de monitoramento do NGINX__ :

  - Verifique se o serviço NGINX está online.
  - Registrador do resultado da verificação em um diretório pré-definido.
  - O log deve conter:
    - _Dados e hora da verificação;_ 
    - _Nome do serviço monitorado;_ 
    - _Status do serviço (ONLINE ou OFFLINE);_
    - _Mensagem personalizada sobre o estado atual._
    
- __Automatizar a execução do script__ : Configure a execução do script de monitoramento de forma automática, utilizando o crontabpara rodá-lo a cada 5 minutos.
- __Fazer versionamento e documentação do projeto através do Github.__

## 3. Passo a Passo

## 3.1. Ativar o WSL no Windows:
- Abra o power shell como administrador e execute o seguinte comando:
```powershell
wsl --install
```
- Reinicie o sistema após a instalação, se solicitado.

## 3.2. Instalar o Unbutu:
- Após a instalação do WSL, abra o Microsoft Store e instale o Unbutu 20.04 ou superior.

## 3.3. Instalar o servidor Nginx no Unbutu:
- No terminal Unbutu, digite:
```powershell
sudo apt install nginx
```
- Após a instalação, para verificar se o Nginx está funcionando, digite:
```powershell
sudo systemctl status nginx
```

![Captura de tela 2024-12-18 143816](https://github.com/user-attachments/assets/1de157ca-347f-482b-8f30-2da8349a845d)


- Abra seu navegador e digite http://localhost. Se o Nginx estiver funcionando, você verá a seguinte página:
  
  
![Captura de tela 2024-12-18 144651](https://github.com/user-attachments/assets/ac160411-fce7-4d5c-acde-a6e84f760cb4)


- Configurar as permissões de escrita na pasta /var/log/nginx para criar logs personalizados:

```bash
sudo chmod 722 /var/log/nginx
```

![Captura de tela 2024-12-18 160007](https://github.com/user-attachments/assets/a7554b2c-2684-4606-ab9e-048e7e5e3d6c)

- Criar os arquivos de log com os seguintes comandos:
  
```bash
sudo touch /var/log/nginx/servico_online.log
sudo touch /var/log/nginx/servico_offline.log
````

![Captura de tela 2024-12-18 162728](https://github.com/user-attachments/assets/67ba7cbe-2d8f-48e3-895f-814c7e0d87b0)

## 3.4. Criar script para verificação de status do Nginx:
- Criar pasta e script de monitoramento de status do servidor Nginx:

```bash
mkdir ~/projeto1
````

- Criar arquivo verificar_nginx.sh dentro da pasta projeto 1:
![Captura de tela 2024-12-20 140807](https://github.com/user-attachments/assets/d960e08a-5c6a-46ce-b0ac-78bb2ed1c04e)

- Dentro do editor nano, insira o seguinte código:

![Captura de tela 2024-12-18 175036](https://github.com/user-attachments/assets/76c6b2d6-f913-4b20-9612-9e3a2799b477)
![Captura de tela 2024-12-18 175126](https://github.com/user-attachments/assets/afb1ca77-8088-4dfe-842d-e71716313cdc)

Este script monitora o status do serviço nginx e registra logs indicando se ele está ativo ou inativo.

__- Caso o Nginx esteja ativo:__
    - _O status é registrado como "ONLINE" no arquivo servico_online.log_
    
__- Caso o Nginx esteja inativo:__
    - _O status é registrado como "OFFLINE" no arquivo servico_offline.log_

## 3.5. Executando o script

-NGINX online

![Captura de tela 2024-12-19 160335](https://github.com/user-attachments/assets/64023798-ff09-4f48-8add-0902e9358f2d)

-NGINX offline

![Captura de tela 2024-12-19 160325](https://github.com/user-attachments/assets/891468fc-4214-4890-a96f-9eb503ae7fe5)

## 3.6. Automatização da execução do script

- Para automatizar a execução do script a cada 5 minutos, foi utilizado o crontab que permite programar tarefas para serem executadas de maneira independente.

```bash
sudo crontab -e
````

## 3.6.1. Adicionar a seguinte linha ao final do arquivo:

```bash
*/5 * * * * /scripts/verifica_servidor.sh
````

## 3.6.2. Explicação da sintaxe:

__*/5:__ _Este campo representa os minutos. Isso */5 significa que o script será executado a cada 5 minutos, começando no minuto 0 de cada hora (por exemplo, 00:00, 00:05, 00:10, etc.)._

__*:__  _O segundo campo representa as horas. O * indica que o script será executado a qualquer hora do dia (ou seja, não há restrição de hora)._

__*:__ _O terceiro campo é para o dia do mês. O * indica que o script será executado em qualquer dia do mês._

__*:__ _O quarto campo representa o mês. O * novo significa que o script será executado em qualquer mês._

__*:__ _O quinto campo é para o dia da semana. O * indica que o script será executado em qualquer dia da semana (segunda-feira a domingo)._

## 4. Resultado:
Essa configuração faz com que o script verifica_servidor.sh seja executado automaticamente a cada 5 minutos, sem a necessidade de intervenção manual, garantindo uma verificação periódica do servidor ou dos processos que o script está monitorando.

__4.1. Logs quando o sistema está online:__

![Captura de tela 2024-12-20 212316](https://github.com/user-attachments/assets/1146b2fa-e015-424f-afd0-2d3e81bc2451)
![Captura de tela 2024-12-20 211951](https://github.com/user-attachments/assets/ad395331-cc88-43b5-b391-b1b6aad41366)

__4.2. Logs quando o sistema está offline:__

![Captura de tela 2024-12-20 212400](https://github.com/user-attachments/assets/7feb6dcd-98b3-4930-8f1c-f61e9ac37a24)
![Captura de tela 2024-12-20 210652](https://github.com/user-attachments/assets/a5a816b3-9825-4768-84fe-451123e7f8f1)











