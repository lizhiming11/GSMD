mkdir -p output/dastool

while read sample; do
    DAS_Tool \
        -i output/binning_single/${sample}/metabat2.scaffolds2bin.tsv,\
output/binning_single/${sample}/maxbin2.scaffolds2bin.tsv,\
output/binning_single/${sample}/concoct.scaffolds2bin.tsv \
        -l metabat2,maxbin2,concoct \
        -c output/assembly/${sample}.contigs.fa.gz \
        -o output/dastool/\({sample}/\){sample} \
        --write_bins \
        --threads 16
done < sample.list
