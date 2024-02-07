import os
import re

# Obtém o nome da branch a partir da variável de ambiente
branch_name = os.getenv("BRANCH_NAME")

# Remove o prefixo 'feature/' do nome da branch
if branch_name is not None:
    # Remove o prefixo 'feature/' do nome da branch, se presente
    branch_name = re.sub(r'^feature/', '', branch_name)
    # Define o nome da view com base no nome da branch
    view_name = ''
    if branch_name == 'dev':
        view_name = 'dlh-dev-brlm-qr8'
    elif branch_name == 'prod':
        view_name = 'dlh-prd-brlm-zcb'
    else:
        view_name = 'Branch desconhecida.'
    # Imprime o nome da view
    print('O nome da view é:', view_name)
else:
    print('A variável de ambiente BRANCH_NAME não está definida.')
    