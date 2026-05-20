mkdir -p output/drep_fMAGs

dRep dereplicate output/drep_fMAGs \
    -g output/filtered_fMAGs/*.fa \
    -p 50 \
    -pa 0.9 \
    -sa 0.95 \
    -nc 0.3 \
    --S_algorithm fastANI \
    -comp 50 \
    -con 10
