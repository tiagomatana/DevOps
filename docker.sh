#!/bin/bash

clear
while true; do
echo "==========================================================
        Digite o número do container a ser instalado:
        1 - Linda
        2 - Atom
        3 - Eclipse
        4 - NodeJS
        5 - NPM
        6 - Postman
        7 - Robo3T
        8 - Visual Studio Code
        9 - Meld
        10 - Intellij IDEA Community
        11 - Intellij IDEA Ultimate
        12 - Vim
        13 - Git
        14 - Maven
        15 - Tmux

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
        sudo docker run --name linda -i -t --net=host -p 5432:5432 -p 8080:8080 otussolutions/linda:1.0 /bin/bash;;
    2)
        sudo add-apt-repository ppa:webupd8team/atom -y && sudo apt-get update && sudo apt-get install atom -y;;
  
    0)
        echo "Saindo..."
        exit;;
    *)
        echo
        echo "ERRO: opção inválida"
        echo ;;
esac
done
