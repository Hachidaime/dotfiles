#!/usr/bin/python3
# -*- coding: utf-8 -*-
import re
import sys
from clang_format import clang_format_diff
if __name__ == '__main__':
    sys.argv[0] = re.sub(r'(-script\.pyw|\.exe)?$', '', sys.argv[0])
    sys.exit(clang_format_diff())
