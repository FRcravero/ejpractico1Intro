#!/bin/bash

FLAGPARAM=1

while getopts "d" paramOpt; do
    case $paramOpt in
        d)
            rm -rf ~/EPNro1
            pkill -f consolidar.sh
            FLAGPARAM=0
            ;;
        *)
            echo "Opcion no válida"
            exit 1
            ;;
    esac
done

if [ "$FLAGPARAM" != 1 ]; then
    exit 0
fi

echo "Elegir opcion"
echo "1 - Crear entorno en home"
echo "2 - Arrancar proceso"
echo "3 - Mostrar listado de FILENAME.txt"
echo "4 - Mostrar las 10 notas mas altas"
echo "5 - Mostrar un alumno"
echo "* - Salir"
echo "Ingrese la opción del menú: "

read opcion

case "$opcion" in
    1)
        cd ~
        mkdir -p EPNro1
        cd EPNro1
        mkdir -p entrada salida procesado
        ;;
    2)
        mv consolidar.sh ~/EPNro1
        cd ~/EPNro1
        ./consolidar.sh &
        ;;
    3)
        cd ~/EPNro1
        if [ -f "salida/$FILENAME.txt" ]; then
            echo "Archivo 'salida/$FILENAME.txt' existe, mostrando listado:"
            sort -t' ' -k1 -n "salida/$FILENAME.txt"
        fi
        ;;
    4)
        cd ~/EPNro1
        if [ -f "salida/$FILENAME.txt" ]; then
            echo "Archivo 'salida/$FILENAME.txt' existe, mostrando 10 mejores notas:"
            sort -t' ' -k5 -nr "salida/$FILENAME.txt" | head -n 10
        fi
        ;;
    5)
        cd ~/EPNro1
        if [ -f "salida/$FILENAME.txt" ]; then
            echo "Archivo 'salida/$FILENAME.txt' existe, ingrese padron a buscar:"
            read padron
            grep "$padron" "salida/$FILENAME.txt"
        fi
        ;;
    *)
        echo "Salir"
        ;;
esac
