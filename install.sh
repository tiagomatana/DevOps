#!/bin/bash

clear
while true; do
echo "==========================================================
        Digite o número do componente a ser instalado:
        1 - Java 8
        2 - Atom
        3 - Eclipse
        4 - NodeJS
        5 - NPM
        6 - Postman
        7 - Robomongo
        8 - Visual Studio Code
        9 - Meld
        10 - Intellij IDEA Community
        11 - Intellij IDEA Ultimate
        12 - Vim
        13 - Git
        14 - Maven
        15 - Tmux
        16 - Java 7
        17 - Docker

        EXTRAS
        21 - Spotify
        22 - HipChat
        0 - Sair
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
        sudo add-apt-repository ppa:webupd8team/java
        sudo apt-get update
        sudo apt-get install oracle-java8-installer;;
    2)
        sudo add-apt-repository ppa:webupd8team/atom -y && sudo apt-get update && sudo apt-get install atom -y;;
    3)
        sudo apt-get install eclipse
        sudo apt-get update;;
    4)
        curl -sL https://deb.nodesource.com/setup_8.x | sudo -E bash -
        sudo apt-get install -y nodejs;;
    5)
        sudo apt install npm;;
    6)
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
        Categories=Development;" > ~/.local/share/applications/postman.desktop';;
    7)
        wget https://download.robomongo.org/1.0.0/linux/robomongo-1.0.0-linux-x86_64-89f24ea.tar.gz
        tar xf robomongo-1.0.0-linux-x86_64-89f24ea.tar.gz
        sudo mv robomongo-1.0.0-linux-x86_64-89f24ea /usr/bin/robomongo
        sudo mkdir /opt/robomongo
        wget http://mongodb-tools.com/img/robomongo.png -O /opt/robomongo/robomongo.png
        sudo sh -c 'echo "[Desktop Entry]
          Encoding=UTF-8
          Name=Robomongo
          Comment=Launch Robomongo
          Icon=/opt/robomongo/robomongo.png
          Exec=/usr/bin/robomongo/bin/robomongo
          Terminal=false
          Type=Application
          Categories=Developer;
          StartupNotify=true" > ~/.local/share/applications/robomongo.desktop';;

    8)
        sudo apt-get install curl
        curl https://packages.microsoft.com/keys/microsoft.asc | gpg --dearmor > microsoft.gpg
        sudo mv microsoft.gpg /etc/apt/trusted.gpg.d/microsoft.gpg
        sudo apt-get update
        sudo sh -c 'echo "deb [arch=amd64] https://packages.microsoft.com/repos/vscode stable main" > /etc/apt/sources.list.d/vscode.list'
        sudo apt-get install code;;
    9)
        sudo apt-get install meld;;
    10)
        sudo add-apt-repository ppa:ubuntuhandbook1/apps
        sudo apt-get update
        sudo apt-get install intellij-idea-community;;
    11)
        sudo add-apt-repository ppa:ubuntuhandbook1/apps
        sudo apt-get update
        sudo apt-get install intellij-idea-ultimate;;
    12)
        sudo apt-get install vim;;
    13)
        sudo apt-get update
        sudo apt-get install git;;
    14)
        sudo apt-get install maven;;
    15)
        sudo apt-get install tmux;;
    16)
        wget http://tiagomatana.esy.es/java7/java-7-oracle.tar.xz
        tar -xvzf java-7-oracle.tar.xz
        sudo rm -rf java-7-oracle.tar.xz
        sudo mv java-7-oracle /usr/lib/jvm/;;
    17)
        sudo apt-get update
        sudo apt-get install apt-transport-https ca-certificates curl software-properties-common
        curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo apt-key add -
        sudo apt-key fingerprint 0EBFCD88
        sudo add-apt-repository "deb [arch=amd64] https://download.docker.com/linux/ubuntu zesty stable"
        sudo apt-get update
        sudo apt-get install docker-ce;;
    21)
        sudo sh -c "echo 'deb http://repository.spotify.com stable non-free' >> /etc/apt/sources.list.d/spotify.list"
        sudo apt-key adv --keyserver hkp://keyserver.ubuntu.com:80 --recv-keys BBEBDCB318AD50EC6865090613B00F1FD2C19886 0DF731E45CE24F27EEEB1450EFDC8610341D9410
        sudo apt-get update
        sudo apt-get install spotify-client;;
    22)
        wget https://atlassian.artifactoryonline.com/atlassian/hipchat-apt-client/pool/HipChat4-4.0.1517-Linux.deb
	sudo dpkg -i HipChat4-4.0.1517-Linux.deb
	sudo rm -rf HipChat4-4.0.1517-Linux.deb;;
    0)
        echo "Saindo..."
        exit;;
    *)
        echo
        echo "ERRO: opção inválida"
        echo ;;
esac
done
