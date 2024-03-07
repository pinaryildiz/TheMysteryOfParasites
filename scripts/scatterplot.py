import pandas as pd
import matplotlib.pyplot as plt

r_rna = ["T_vaginalis", "T_foetus", "H_meleagridis"]


def get_data(name):
    gff_data = pd.read_csv(f"""../output/barrnap/{name}_rrna_count.gff""", sep='\t', comment='#', header=None,
                           usecols=[0, 3, 4, 6, 8], names=['seqid', 'start', 'end', 'strand', 'attributes'])

    r_rna_data = gff_data[gff_data['attributes'].str.contains('rRNA')]
    plt.gca().set_facecolor('none')
    plt.scatter(r_rna_data['start'], r_rna_data['end'], alpha=0.5)

    plt.title('rRNA Gen Positions')
    plt.xlabel('Start Position')
    plt.ylabel('End Position')
    plt.savefig(f"../image/rRNA/{name}_rRNA_scatterplot.png")
    plt.close()


for i in r_rna:
    get_data(i)
