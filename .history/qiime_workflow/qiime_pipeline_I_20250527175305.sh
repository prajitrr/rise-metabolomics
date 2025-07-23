

# qiime feature-table filter-samples \
#     --i-table ./data/rise_urine_deblur_ref_seq.qza \
#     --m-metadata-file ./data/rise_urinary_sample_metadata_filtered.txt \
#     --p-where '[Group]!="NAN"' \
#     --o-filtered-table ./data/rise_urine_deblur_ref_seq_filtered.qza

# qiime greengenes2 taxonomy-from-table \
#     --i-reference-taxonomy ./data/2024.09.taxonomy.asv.nwk.qza \
#     --i-table ./data/rise_urine_deblur_ref_seq_filtered.qza \
#     --o-classification ./data/rise_urine_gg2filtered_taxonomy.qza

# qiime taxa filter-table \
#     --i-table ./data/rise_urine_deblur_ref_seq_filtered.qza \
#     --i-taxonomy ./data/rise_urine_gg2filtered_taxonomy.qza \
#     --p-include 'Bacteria, Archaea' \
#     --o-filtered-table ./data/rise_urine_gg2filtered.qza

# qiime feature-table summarize \
#     --i-table ./data/rise_urine_gg2filtered.qza \
#     --m-sample-metadata-file ./data/rise_urinary_sample_metadata_filtered.txt \
#     --o-visualization ./data/visualization/rise_urine_gg2filtered_summary-stats.qzv

qiime diversity alpha-rarefaction \
    --i-table ./data/rise_urine_gg2filtered.qza \
    --i-phylogeny ./data/2024.09.phylogeny.asv.nwk.qza \
    --p-max-depth 8000 \
    --p-steps 15 \
    --m-metadata-file ./data/rise_urinary_sample_metadata_filtered.txt \
    --o-visualization ./data/visualization/rise_urine_gg2filtered_alpha-rarefaction.qzv