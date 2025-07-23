qiime feature-table filter-samples \
    --i-table ./data/rise_urine_deblur_ref_seq.qza \
    --m-metadata-file ./data/rise_urinary_sample_metadata_final.txt \
    --p-where '[Group]!="NAN"' \
    --o-filtered-table ./data/rise_urine_deblur_ref_seq_filtered.qza

qiime greengenes2 taxonomy-from-table \
    --i-reference-taxonomy ./data/2024.09.taxonomy.asv.nwk.qza \
    --i-table ./data/rise_urine_deblur_ref_seq_filtered.qza \
    --o-classification ./data/rise_urine_gg2filtered.qza
    
qiime feature-table summarize \
    --i-table ./data/rise_urine_gg2filtered.qza \
    --m-sample-metadata-file ./data/rise_urinary_sample_metadata_final.txt \
    --o-visualization ./data/visualization/rise_urine_gg2filtered_summary-stats.qzv

qiime feature-table tabulate-seqs \
    --i-data ./data/rise_urine_gg2filtered.qza \
    --o-visualization ./data/visualization/rise_urine_gg2filtered_tabulated.qzv   

!qiime diversity alpha-rarefaction \
    --i-table {root}data/Microbiome/gg2filt_longIHC.qza \
    --i-phylogeny ../../../greengenes2/2022.10.phylogeny.asv.nwk.qza \
    --p-max-depth 15000 \
    --p-steps 15 \
    --m-metadata-file {root}data/Microbiome/longIHC_metadata_cleaned.txt \
    --o-visualization {root}data/Microbiome/longIHC_alpha_rarefaction.qzv