#!/bin/bash

# Copyright (C) 2004-2024 Murilo Gomes Julio
# SPDX-License-Identifier: GPL-2.0-only

# Organização: Mestre da Info
# Site: https://linktr.ee/mestreinfo

while true; do
	echo ""
	echo "-------------------------------- CreateExecutable --------------------------------"
    echo "Selecione uma opção:"
    echo '1. Preparar o Ambiente'
    echo '2. Compilar o MIAppSetup'
    echo "3. Sair"
    echo "-------------------------------- /CreateExecutable --------------------------------"
	echo ""
	
    read -p "Opção: " option

    case $option in
    	1)
    		miDir=$(pwd)

			echo "Criando diretório build/tmp/..."
			mkdir -p build/tmp/
			
    		echo "Baixando o Python-3.11.2..."
			wget -O build/tmp/python-3.11.2.exe https://www.python.org/ftp/python/3.11.2/python-3.11.2.exe

			echo "Configurar para Windows 10..."
			WINEPREFIX="$miDir/build/.wine/" winecfg

			echo "Instalando o Python3... (Remover tudo, deixar só o pip ativado e alterar a localização para C:\Python3\)"
			WINEPREFIX="$miDir/build/.wine/" wine build/tmp/python-3.11.2.exe

			echo "Instalando o PyInstaller..."
			WINEPREFIX="$miDir/build/.wine/" wine build/.wine/drive_c/Python3/python.exe build/.wine/drive_c/Python3/Scripts/pip.exe install pyinstaller

			echo "Concluido!"
			;;
		2)
			echo "Compilando miappsetup.py..."
			
			miDir=$(pwd)
			WINEPREFIX="$miDir/build/.wine/" wine build/.wine/drive_c/Python3/Scripts/pyinstaller.exe --onefile miappsetup.py
			
			echo "Concluido!"
			;;
        3)
            echo "Saindo..."
            exit 0
            ;;
        *)
            echo "Opção inválida. Por favor, escolha uma opção válida."
            ;;
    esac
done
