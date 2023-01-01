#!/usr/bin/env python3
import sys

began = 0
for line in sys.stdin:
    if(began == 0 and "BEGIN" in line.strip("\n")):
