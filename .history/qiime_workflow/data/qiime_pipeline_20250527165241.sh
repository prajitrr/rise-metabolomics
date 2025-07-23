qiime feature-table filter-samples \
    --i-table ./data/rise_urine_deblur_ref_seq.qza \
    --m-metadata-file ./data/rise_urinary_sample_metadata_final.txt \
    --p-where '[Group]!="NAN"' \
    --o-filtered-table ./data/rise_urine_deblur_ref_seq_filtered.qza

qiime greengenes2 taxonomy-from-table \
