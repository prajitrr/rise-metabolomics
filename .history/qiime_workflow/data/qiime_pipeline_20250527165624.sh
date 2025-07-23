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
