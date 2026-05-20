diamond blastp \
    -d RefSeq_protein.dmnd \
    -q output/GSMD_gene_catalog_representatives.faa \
    -o output/GSMD_vs_RefSeq.tsv \
    -f 6 \
    --evalue 1e-5 \
    --threads 50
