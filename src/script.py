import os
from dotenv import dotenv_values

# Pegar o nome da branch atual
branch_name = os.popen('git rev-parse --abbrev-ref HEAD').read().strip()

# Escrever o nome da branch no arquivo .env
with open('config/.env', 'w') as env_file:
    env_file.write(f'BRANCH_NAME={branch_name}\n')

# Confirmar que o arquivo .env foi atualizado corretamente
print("Nome da branch atual salvo no arquivo .env:", branch_name)