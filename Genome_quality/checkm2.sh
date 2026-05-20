mkdir -p output/checkm2

checkm2 predict \
    --threads 50 \
    --input output/all_MAGs/ \
    --output-directory output/checkm2/
