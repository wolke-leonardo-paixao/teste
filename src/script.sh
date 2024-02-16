#!/bin/bash

exit_with_error() {
    echo "Erro: $1"
    exit 1
}

# Encontrar a branch atual
branch=$(git rev-parse --abbrev-ref HEAD)

# Verificar se estamos em uma branch de interesse
if [ "$branch" != "dev" ] && [ "$branch" != "prod" ]; then
    exit_with_error "Este script só pode ser executado nas branches 'dev' ou 'prod'."
fi

# Encontrar diretórios e arquivos
find src -type f -name "*.sql" | while read -r file; do
    if [ -f "$file" ]; then
        if [ "$branch" = "dev" ]; then
            sed -i "s/dlh-prd-brlm-zcb/dlh-dev-brlm-qr8/g" "$file"
        elif [ "$branch" = "prod" ]; then
            sed -i "s/dlh-dev-brlm-qr8/dlh-prd-brlm-zcb/g" "$file"
        fi
        git add "$file"
    fi
done

# Fazer commit das alterações
git commit -m "Alteração automática de string na branch $branch"

# Enviar alterações para o repositório remoto
git push origin "$branch"

# Finalizar
exit 0
