import pandas as pd
import matplotlib.pyplot as plt
import seaborn as sns

df = pd.read_csv("../output/blastn/N_meningitidis/S_pneumoniae.blastn")

df.columns = ['qseqid', 'sseqid', 'pident', 'length', 'mismatch', 'gaopen', 'qstart', 'qend', 'sstart', 'send', 'evalue', 'bitscore']

num_hits = len(df)

print("Number of hits for N_meningitidis vs. S_pneumoniae: ", num_hits)

sns.histplot(data=df, x='pident')

