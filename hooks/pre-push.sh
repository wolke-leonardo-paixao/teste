#!/bin/bash

# Obter o nome do branch atual
current_branch=$(git rev-parse --abbrev-ref HEAD)

# Definir a variável de ambiente BRANCH_NAME
export BRANCH_NAME="$current_branch"

# Executar o segundo script
../script.py