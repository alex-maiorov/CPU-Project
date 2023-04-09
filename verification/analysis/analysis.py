#!/usr/bin/env python3
import sys

#verification run dictionary structure:
#{
#name:name of run, other keys may be other metadata
#entries:[] list of entry dictionaries outlined below
#}

#entry 
#{
#"signal":integer value or None if signal is undefined or partially undefined
#}

def pre_read(content):#returns dictionary structure
    verification_dictionary = {
        "name":"",
        "entries":[]
        }
    for line in sys.stdin:
        if("BEGIN" in line.strip("\n") and state == 0):
            state = 0
            name = line.split(" ")[-1]
        if(state == 1):
            verification_dictionary



def alu_verify(header, data):
