import os
import re

branch_name = os.getenv("BRANCH_NAME")

if branch_name is not None:
    branch_name = re.sub(r'^feature/', '', branch_name)
    
    temp_file = 'branch_name.txt'
    
    with open(temp_file, 'w') as file:
        file.write(branch_name)
else:
    print('A variável de ambiente BRANCH_NAME não está definida.')
