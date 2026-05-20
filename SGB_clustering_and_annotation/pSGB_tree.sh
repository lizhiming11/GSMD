mkdir -p output/pSGB_tree

gtdbtk infer \
    --msa_file output/gtdbtk_pSGB/align/gtdbtk.bac120.user_msa.fasta.gz \
    --out_dir output/pSGB_tree/ \
    --cpus 50


iqtree2 \
    -s pSGB_marker_alignment.fa \
    -m MFP \
    -B 1000 \
    -T AUTO \
    --prefix output/pSGB_tree/pSGB
