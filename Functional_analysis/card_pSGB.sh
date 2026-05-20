mkdir -p output/CARD_RGI

find output/prodigal_pSGB/*.faa | parallel -j 10 '
    sample=$(basename {} .faa)

    rgi main \
        --input_sequence {} \
        --output_file output/CARD_RGI/${sample} \
        --input_type protein \
        --num_threads 8
'
