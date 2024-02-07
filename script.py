#!/bin/python

import os
import re

# Obtém o nome da branch a partir da variável de ambiente
view_name = os.getenv("VIEW_NAME")

print('O nome da view é:', view_name)

