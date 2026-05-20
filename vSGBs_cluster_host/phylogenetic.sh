mkdir -p output/viptree

ViPTreeGen \
    -i output/vSGB_representatives.fa \
    -o output/viptree/
    
#The phylogenetic tree was further pruned using Treemmer if necessary.
treemmer \
    -t output/viptree/vSGB.tree \
    -X 0.95
