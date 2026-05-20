mkdir -p output/depth output/bam output/binning_single

while read fq1; do
    sample=$(basename "${fq1}" .rmhost.1.fq.gz)
    fq2=output/rmhost_reads/${sample}.rmhost.2.fq.gz
    contig=output/assembly/${sample}.contigs.fa.gz

    mkdir -p output/depth/${sample}

    # 如果 contig 是 .fa.gz，需要先解压或用 samtools faidx 生成索引再用 bowtie2-build
    gunzip -c "${contig}" > output/assembly/${sample}.contigs.fa
    contig_unzip=output/assembly/${sample}.contigs.fa

    # 建索引
    bowtie2-build \
        "${contig_unzip}" \
        output/depth/${sample}/${sample}

    # 比对 reads
    bowtie2 \
        -x output/depth/${sample}/${sample} \
        -1 "${fq1}" \
        -2 "${fq2}" \
        -S output/bam/${sample}.sam \
        -p 16

    # SAM 转排序 BAM
    samtools view -bS output/bam/${sample}.sam | \
        samtools sort -@ 16 -o output/bam/${sample}.sort.bam

    samtools index output/bam/${sample}.sort.bam

done < samples_rmhost1.txt



mkdir -p output/binning_single

while read fq1; do
    sample=$(basename "${fq1}" .rmhost.1.fq.gz)
    fq2=output/rmhost_reads/${sample}.rmhost.2.fq.gz
    contig=output/assembly/${sample}.contigs.fa   # 如为 .fa.gz，请先解压

    mkdir -p output/binning_single/${sample}

    metawrap binning \
        -o output/binning_single/${sample} \
        -t 16 \
        -a "${contig}" \
        --metabat2 --concoct --maxbin2 \
        -1 "${fq1}" \
        -2 "${fq2}"

done < samples_rmhost1.txt
