mkdir -p output/fungal_genemark

find output/fSGB_representatives/*.fa | parallel -j 10 '
    sample=$(basename {} .fa)

    gmes_petap.pl \
        --sequence {} \
        --ES \
        --fungus \
        --cores 8 \
        --work_dir output/fungal_genemark/${sample}
'
