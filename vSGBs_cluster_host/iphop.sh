mkdir -p output/iphop_custom_db

iphop add_to_db \
    --fna_dir output/pSGB_representatives/ \
    --gtdb_dir output/gtdbtk_pSGB/ \
    --out_dir output/iphop_custom_db/ \
    --db_dir /path/to/iphop_db/


mkdir -p output/iphop_prediction

iphop predict \
    --fa_file output/vSGB_representatives.fa \
    --db_dir output/iphop_custom_db/ \
    --out_dir output/iphop_prediction/ \
    --num_threads 50


