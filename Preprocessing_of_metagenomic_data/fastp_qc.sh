mkdir -p output/clean_reads output/fastp

while read sample fq1 fq2; do
    fastp \
        -i ${fq1} \
        -I ${fq2} \
        -o output/clean_reads/${sample}.clean.1.fq.gz \
        -O output/clean_reads/${sample}.clean.2.fq.gz \
        -q 20 \
        -l 30 \
        -w 8 \
        -h output/fastp/${sample}.html \
        -j output/fastp/${sample}.json
done < samples_raw_pe.tsv
