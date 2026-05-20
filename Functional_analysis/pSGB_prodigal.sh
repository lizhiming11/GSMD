mkdir -p output/prodigal_pSGB

find output/pSGB_representatives/*.fa | parallel -j 20 '
    sample=$(basename {} .fa)

    prodigal \
        -i {} \
        -p single \
        -f gff \
        -a output/prodigal_pSGB/${sample}.faa \
        -d output/prodigal_pSGB/${sample}.ffn \
        -o output/prodigal_pSGB/${sample}.gff
