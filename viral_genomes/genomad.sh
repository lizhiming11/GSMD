mkdir -p output/genomad

find output/viral_contigs_5kb/*.fa | parallel -j 10 '
    sample=$(basename {} .5kb.fa)

    genomad end-to-end \
        --cleanup \
        {} \
        output/genomad/${sample} \
        /path/to/genomad_db
'
