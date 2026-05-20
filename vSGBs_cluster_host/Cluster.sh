makeblastdb \
    -in output/filtered_vMAGs.fa \
    -dbtype nucl \
    -out output/filtered_vMAGs.fa

blastn \
    -query output/filtered_vMAGs.fa \
    -db output/filtered_vMAGs.fa \
    -out output/vMAGs.self_blast.tsv \
    -evalue 1e-10 \
    -word_size 20 \
    -outfmt "6 qseqid sseqid pident length qlen slen evalue bitscore" \
    -num_threads 50
