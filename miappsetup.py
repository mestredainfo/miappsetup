#!/usr/bin/env python3

# Copyright (C) 2004-2024 Murilo Gomes Julio
# SPDX-License-Identifier: GPL-2.0-only

# Organização: Mestre da Info
# Site: https://linktr.ee/mestreinfo

import sys
import os
import shutil
from zipfile import ZipFile

print('')
print('Instalador do MIApp')
print('')
print('Aguarde enquanto a instalação é realizada. Ao concluir essa janela será fechada!')
print('')
print('Desinstalando a versão anterior...')
try:
	shutil.rmtree('C:\\\\miapp\\\\')
	print('')
except OSError as e:
	print('')

print('Extraindo arquivos em "C:\\miapp\\"...')
zf = ZipFile(os.path.dirname(sys.executable) + '/miapp-win32-x64.zip', 'r')
zf.extractall('C:\\\\')
zf.close()

print('')
print('Renomeando pasta de "miapp-win32-x64" para "miapp"...')
os.rename('C:\\\\miapp-win32-x64\\\\', 'C:\\\\miapp\\\\')
print('')
print("Instalação concluída com sucesso!")
print('')
sys.exit()
