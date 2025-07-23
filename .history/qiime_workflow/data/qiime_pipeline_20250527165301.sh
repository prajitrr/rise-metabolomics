qiime feature-table filter-samples \
    --i-table ./data/rise_urine_deblur_ref_seq.qza \
    --m-metadata-file ./data/rise_urinary_sample_metadata_final.txt \
    --p-where '[Group]!="NAN"' \
    --o-filtered-table ./data/rise_urine_deblur_ref_seq_filtered.qza

qiime greengenes2 taxonomy-from-table \
    --i-reference-taxonomy ./data/2024.09.taxonomy.asv.nwk.qza
    --i-table {root}data/Microbiome/deblur2021-refhit-biomtable.qza \
    --o-classification {root}data/Microbiome/longIHC_gg2filt_taxonomy.qza