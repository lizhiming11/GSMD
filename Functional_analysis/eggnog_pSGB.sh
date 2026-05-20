mkdir -p output/eggnog_pSGB

find output/prodigal_pSGB/*.faa | parallel -j 10 '
    sample=$(basename {} .faa)

    emapper.py \
        -i {} \
        --itype proteins \
        -o ${sample} \
        --output_dir output/eggnog_pSGB/ \
        --cpu 8
        --d prok
'
