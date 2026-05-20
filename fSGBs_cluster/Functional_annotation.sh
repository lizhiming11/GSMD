mkdir -p output/eggnog_fSGB

find output/fungal_proteins/*.faa | parallel -j 10 '
    sample=$(basename {} .faa)

    emapper.py \
        -i {} \
        --itype proteins \
        -o ${sample} \
        --output_dir output/eggnog_fSGB/ \
        --d euk
        --cpu 8
