mkdir -p output/gtdbtk_pSGB

gtdbtk classify_wf \
    --genome_dir output/pSGB_representatives/ \
    --out_dir output/gtdbtk_pSGB/ \
    --cpus 50 \
    --extension fa
