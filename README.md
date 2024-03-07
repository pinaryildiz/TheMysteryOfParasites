# The Mystery of Parasites

"The Mystery of Parasites" is a computational biology project aimed at uncovering the genomic secrets of various parasitic species. Utilizing a series of bioinformatic tools and workflows, this project analyzes genomic sequences to identify tRNA genes, ribosomal RNA genes, and repeats, alongside conducting BLAST searches for comparative genomics studies.

## Getting Started

These instructions will get you a copy of the project up and running on your local machine for development and testing purposes. See deployment for notes on how to deploy the project on a live system.

### Prerequisites

What things you need to install the software and how to install them:

- [Snakemake](https://snakemake.readthedocs.io/en/stable/)
- [Conda](https://docs.conda.io/projects/conda/en/latest/user-guide/install/index.html)

## Installing

A step-by-step series of examples that tell you how to get a development environment running:

1. Clone the repository to your local machine:

```bash
git clone https://github.com/pinaryildiz/TheMysteryOfParasites.git
```

### Dependencies
To run the analysis, you will need Conda installed on your system. If you do not have Conda, please follow the [official installation guide](https://docs.conda.io/projects/conda/en/latest/user-guide/install/).

Once Conda is set up, you can create an environment with all the necessary dependencies using the provided `env.yaml` file. This environment includes tools such as tRNAscan-SE, Barrnap, RepeatMasker, RepeatModeler, BLAST, OrthoFinder, and several Python packages for data manipulation and visualization.

To create and activate the environment, run:

```bash
conda env create -f env.yaml
conda activate TheMysteryOfParasites
```


### Setting Up the Workflow

1. **tRNAscan**: Identifies tRNA genes within the genomic sequences of specified parasites.
2. **Barrnap**: Searches for ribosomal RNA genes, providing insights into the genomic structure related to the organisms' protein synthesis machinery.
3. **Make BLAST Database**: Prepares a BLAST database from the genomic sequences, enabling rapid sequence similarity searches.
4. **BLAST Search**: Performs BLAST searches against the prepared database to find similar sequences across different organisms.
5. **Repeat Analysis**: Uses RepeatMasker and RepeatModeler to identify and analyze repeat sequences within the genomes, crucial for understanding genomic evolution and structure.

## Workflow Execution

To execute the workflow, ensure that you have all the necessary input files in the `resource/Genome/` directory. Then, from the root of your project directory, run:

```bash
snakemake --use-conda
```

This command will execute the workflow as defined in the Snakefile, processing each rule based on the dependencies and inputs specified.


## Contributors

- [Pınar YILDIZ](#) - All projects

## Acknowledgments

- Mention any collaborators, funding agencies, or anyone else who supported the project.