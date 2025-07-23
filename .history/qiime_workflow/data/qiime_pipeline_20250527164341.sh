qiime feature-table filter-samples \
    --i-table ./data/rise_urine_deblur_ref_seq.qza \
    --m-metadata-file ./data/rise_urinary_sample_metadata.txt \
    --p-where '[sample_type]="feces"' \
    --o-filtered-table {root}data/Microbiome/longIHC_gg2filt_feces_table.qza
