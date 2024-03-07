rule all:
    input:
        expand("output/tRNAscan/{sp}.tRNA", sp =["H_meleagridis", "T_vaginalis", "T_foetus"]),
        expand("output/{type}/db/{db}.nhr",type="blastn",db=["T_vaginalis", "T_foetus","H_meleagridis"]),
        expand("output/blastn/T_vaginalis/{sp}.blastn",sp=["T_foetus","H_meleagridis"]),
        expand("output/barrnap/{genome}_rrna_count.gff", genome=["H_meleagridis", "T_vaginalis", "T_foetus"]),
        expand("repeat/{db}/{db}.fasta.tbl", db=["T_vaginalis", "T_foetus", "H_meleagridis"]),

rule tRNAscan_wildcard:
    input:
        genome = "resource/Genome/{genome}.fasta"
    output:
        tRNA = "output/tRNAscan/{genome}.tRNA",
        stats = "output/tRNAscan/{genome}.stats"
    params:
        threads = 2
    conda:
        "env/env.yaml"
    script:
        "scripts/tRNAscan_stats.py"

rule barrnap:
    input:
        genome = "resource/Genome/{genome}.fasta"
    output:
        barrnap_gff = "output/barrnap/{genome}_rrna_count.gff"
    conda: "env/env.yaml"
    script:
        "scripts/barrnap.py"


rule make_blast_db:
    input:
        "resource/Genome/{db}.fasta"
    output:
        "output/{type}/db/{db}.nhr",
        "output/{type}/db/{db}.nin",
        "output/{type}/db/{db}.nsq",
    params:
        output_name = "output/{type}/db/{db}"
    shell:
        'makeblastdb -dbtype nucl -in {input} -out {params.output_name}'


rule blast_wildcard:
    input:
        genome = "resource/Genome/{genome}.fasta",
        db= "output/blastn/db/T_vaginalis.nhr"
    output:
        "output/blastn/T_vaginalis/{genome}.blastn"
    conda:
        "env/env.yaml"
    params:
        perc_identity=94,
        outfmt=6,
        num_threads=2,
        max_target_seqs=1,
        max_hsps=1,
        db_prefix="output/blastn/db/T_vaginalis"
    script:
        "scripts/blastn.py"

rule repeat_db:
    input:
        "resource/Genome/{db}.fasta"
    output:
        "repeat/{db}/consensi.fa",
        "repeat/{db}/consensi.fa.masked",
        "repeat/{db}/{db}.fasta.tbl"
    params:
        db_name="{db}"
    shell:
        "BuildDatabase -name {params.db_name} {input}"

# rule orthofinder:
#     input:
#         fasta = "resource/Proteome/"
#     output:
#         directory("output/orthofinder/")
#     # conda:
#     #     "env/env.yaml"
#     script:
#         "scripts/orthofinder.py"
