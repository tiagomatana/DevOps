#!/bin/bash

clear
while true; do
echo "==========================================================
        Digite o número do componente a ser instalado:
        1 - Java 8
        2 - Atom
        3 - Spotify
        4 - Eclipse
        5 - NodeJS
        6 - Postman
        7 - Robo3T
        8 - Visual Studio Code
        9 - NPM
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
        sudo apt-get install oracle-java7-installer;;
    2)
        sudo add-apt-repository ppa:webupd8team/atom -y && sudo apt-get update && sudo apt-get install atom -y;;
    3)
        sudo sh -c "echo 'deb http://repository.spotify.com stable non-free' >> /etc/apt/sources.list.d/spotify.list"
        sudo apt-key adv --keyserver hkp://keyserver.ubuntu.com:80 --recv-keys BBEBDCB318AD50EC6865090613B00F1FD2C19886 0DF731E45CE24F27EEEB1450EFDC8610341D9410
        sudo apt-get update
        sudo apt-get install spotify-client;;
    4)
        sudo apt-get install eclipse
        sudo apt-get update;;
    5)
        curl -sL https://deb.nodesource.com/setup_8.x | sudo -E bash -
        sudo apt-get install -y nodejs;;
    6)
        wget https://dl.pstmn.io/download/latest/linux64 -O postman.tar.gz
        sudo tar -xzf postman.tar.gz -C /opt
        rm postman.tar.gz
        sudo ln -s /opt/Postman/Postman /usr/bin/postman
        echo "Copie e cole no Terminal
        cat > ~/.local/share/applications/postman.desktop <<EOL
        [Desktop Entry]
        Encoding=UTF-8
        Name=Postman
        Exec=postman
        Icon=/opt/Postman/resources/app/assets/icon.png
        Terminal=false
        Type=Application
        Categories=Development;
        EOL";;
    7)
        sudo wget https://download.studio3t.com/studio-3t/linux/5.6.3/studio-3t-linux-x64.tar.gz
        sudo tar -xf studio-3t-linux-x64.tar.gz
        rm -rf studio-3t-linux-x64.tar.gz
        ./studio-3t-5.6.3-linux-x64/bin/studio-3t.sh;;
    8)
        sudo sh -c 'echo "deb [arch=amd64] https://packages.microsoft.com/repos/vscode stable main" > /etc/apt/sources.list.d/vscode.list'
        curl https://packages.microsoft.com/keys/microsoft.asc | gpg --dearmor > microsoft.gpg
        sudo mv microsoft.gpg /etc/apt/trusted.gpg.d/microsoft.gpg
        sudo apt-get update
        sudo apt-get install vscode;;
    9)
        sudo apt install npm;;
    0)
        echo "Saindo..."
        exit;;
    *)
        echo
        echo "ERRO: opção inválida"
        echo ;;
esac
done
