mkdir -p output/gene_prediction

find output/assembly/*.contigs.fa.gz | parallel -j 20 '
    sample=$(basename {} .contigs.fa.gz)

    prodigal \
        -i {} \
        -p meta \
        -f gff \
        -a output/gene_prediction/${sample}.faa \
        -d output/gene_prediction/${sample}.ffn \
        -o output/gene_prediction/${sample}.gff
'
