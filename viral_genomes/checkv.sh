mkdir -p output/checkv

checkv end_to_end \
    output/all_viral_contigs.fa \
    output/checkv/ \
    -d /path/to/checkv-db-v1.5 \
    -t 50
