mkdir -p output/gunc

gunc run \
    --input_dir output/all_MAGs/ \
    --db_file /path/to/gunc_db_progenomes2.1.dmnd \
    --out_dir output/gunc/ \
    --threads 50
