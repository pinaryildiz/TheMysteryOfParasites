from snakemake.shell import shell

file = snakemake.input.genome
result = snakemake.output.barrnap_gff

shell(f"""barrnap {file} > {result} """)