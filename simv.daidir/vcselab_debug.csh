#!/bin/csh -f

cd /home/maiorov2/CPU-Project

#This ENV is used to avoid overriding current script in next vcselab run 
setenv SNPS_VCSELAB_SCRIPT_NO_OVERRIDE  1

/software/Synopsys-2021_x86_64/vcs/R-2020.12-SP1-1/linux/bin/vcselab $* \
    -o \
    simv \
    -nobanner \

cd -

