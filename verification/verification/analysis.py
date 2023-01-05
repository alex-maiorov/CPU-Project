#!/usr/bin/env python3
import sys

began = 0;
run_name = ""
csv_linelist = []
for line in sys.stdin:
    if("BEGIN" in line.strip("\n")):
        began = 0;
        
    if(began == 1):
        



def alu_verify(alu_list);