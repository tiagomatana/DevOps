#!/bin/bash

clear
while true; do
echo "==========================================================
        Deseja instalar as dependencias OTUS:
        1 - Sim
        0 - Não
==========================================================="
echo -n "->OPÇÃO:  "

read opcao

#verificar se foi digitada uma opcao
if [ -z $opcao ]; then
    echo "ERRO: digite uma opcao"
    exit
fi

case $opcao in
    1)
        #JAVA 8
        sudo add-apt-repository ppa:webupd8team/java
        sudo apt-get update
        sudo apt-get install oracle-java8-installer
        #NODE JS
        curl -sL https://deb.nodesource.com/setup_8.x | sudo -E bash -
        sudo apt-get install -y nodejs
        #POSTMAN
        apt-get install libconfig-2-4
        wget https://dl.pstmn.io/download/latest/linux64 -O postman.tar.gz
        sudo tar -xzf postman.tar.gz -C /opt
        rm postman.tar.gz
        sudo ln -s /opt/Postman/Postman /usr/bin/postman
        sudo sh -c 'echo "[Desktop Entry]
        Encoding=UTF-8
        Name=Postman
        Exec=postman
        Icon=/opt/Postman/resources/app/assets/icon.png
        Terminal=false
        Type=Application
        Categories=Development;" > ~/.local/share/applications/postman.desktop'
        #CURL
        sudo apt-get install curl
        #MELD
        sudo apt-get install meld
        #VIM
        sudo apt-get install vim
        sudo apt-get update
        #GIT
        sudo apt-get install git
        #MAVEN
        sudo apt-get install maven
        sudo apt-get update
        #DOCKER
        sudo apt-get remove docker docker-engine docker.io
        sudo apt-get update
        sudo apt-get install apt-transport-https ca-certificates curl software-properties-common
        curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo apt-key add -
        sudo apt-key fingerprint 0EBFCD88
        sudo add-apt-repository "deb [arch=amd64] https://download.docker.com/linux/ubuntu $(lsb_release -cs) stable"
        sudo apt-get update
        sudo apt-get install docker-ce
        sudo apt-get install docker.io
        #NPM CONFIG
        npm config set init.author.name 'Administrator User'
        npm config set init.author.email 'admin@example.org'
        npm config set init.author.url 'http://otus-solutions.com.br'
        npm config set email admin@example.org
        npm config set always-auth true
        npm config set _auth 'YWRtaW46YWRtaW4xMjM='
        npm config set registry http://nexus.inf.otus-solutions.com.br/repository/npm-repositories/;;

    0)
        echo "Saindo..."
        exit;;
    *)
        echo
        echo "ERRO: opção inválida"
        echo ;;
esac
done
