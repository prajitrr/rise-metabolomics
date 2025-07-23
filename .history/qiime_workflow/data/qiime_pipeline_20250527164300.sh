qiime feature-table filter-samples \
    --i-table /data
    --m-metadata-file {root}data/Microbiome/longIHC_metadata_cleaned.txt \
    --p-where '[sample_type]="feces"' \
    --o-filtered-table {root}data/Microbiome/longIHC_gg2filt_feces_table.qza
