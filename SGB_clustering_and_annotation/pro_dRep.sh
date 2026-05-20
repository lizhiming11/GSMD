mkdir -p output/drep_rereplicate
dRep dereplicate output/drep_rereplicate \
        -p 8 \
        -pa 0.9 \
        -sa 0.99 \
        -nc 0.3 \
        --S_algorithm fastANI \
        -comp 50 \
        -con 10 \
        -g output/prokaryotic_MAGs/*.fa
