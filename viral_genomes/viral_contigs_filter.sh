mkdir -p output/viral_contigs_5kb

find output/assembly/*.contigs.fa.gz | parallel -j 20 '
    sample=$(basename {} .contigs.fa.gz)

    seqkit seq \
        -m 5000 \
        {} \
        > output/viral_contigs_5kb/${sample}.5kb.fa
