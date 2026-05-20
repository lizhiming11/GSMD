mkdir -p output/rmhost_reads output/bowtie2_host

while read sample fq1 fq2; do
    bowtie2 \
        --very-sensitive \
        -x GRCh38 \
        -1 output/clean_reads/${sample}.clean.1.fq.gz \
        -2 output/clean_reads/${sample}.clean.2.fq.gz \
        --un-conc-gz output/rmhost_reads/${sample}.rmhost.fq.gz \
        -S output/bowtie2_host/${sample}.host.sam \
        -p 16

    mv output/rmhost_reads/\({sample}.rmhost.1.fq.gz output/rmhost_reads/\){sample}.rmhost.1.fq.gz
    mv output/rmhost_reads/\({sample}.rmhost.2.fq.gz output/rmhost_reads/\){sample}.rmhost.2.fq.gz
done < samples_raw_pe.tsv
