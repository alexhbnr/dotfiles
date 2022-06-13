################################################################################
# Study:
# Part:
# Step:
#
# Dependent on:
#
# Alex Huebner, 
################################################################################

import os

if not os.path.isdir("snakemake_tmp"):
    os.makedirs("snakemake_tmp")

#### SAMPLES ###################################################################

################################################################################

rule all:
    input:


rule template:
    input:
        ""
    output:
        ""
    message: ""
    conda: ""
    resources:
        mem = ,
        cores = 
    params: 
    threads: 1
    shell:
        """
        """
