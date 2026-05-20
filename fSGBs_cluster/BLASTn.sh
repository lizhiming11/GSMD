mkdir -p output/fungal_blastn

find output/fSGB_representatives/*.fa | parallel -j 20 '
    sample=$(basename {} .fa)

    blastn \
        -query {} \
        -db /path/to/NCBI_fungi_nt \
        -out output/fungal_blastn/${sample}.blastn.tsv \
        -evalue 1e-5 \
        -outfmt 6 \
        -num_threads 8
'
