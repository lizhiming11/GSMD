mkdir -p output/assembly

while read fq1; do
    sample=$(basename ${fq1} .rmhost.1.fq.gz)
    fq2=output/rmhost_reads/${sample}.rmhost.2.fq.gz

    megahit \
        -1 ${fq1} \
        -2 ${fq2} \
        -o output/assembly/${sample} \
        -t 32 \
        --min-contig-len 1000

    gzip -c output/assembly/\({sample}/final.contigs.fa > output/assembly/\){sample}.contigs.fa.gz
done < samples_rmhost1.txt
