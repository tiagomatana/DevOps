#!/bin/bash

clear
while true; do
echo "==========================================================
        Digite o número do container a ser instalado:
        1 - Linda

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
  
    0)
        echo "Saindo..."
        exit;;
    *)
        echo
        echo "ERRO: opção inválida"
        echo ;;
esac
done
