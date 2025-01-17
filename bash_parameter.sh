#!/bin/bash

Target_task="normal" #choose from normal, filtered, stitched, all

# Parameter used in normal index
    # Index Construction
    K=100
    data_type=float
    dataset_name=SpaceV
    dataset_size=100M
    dist_fn=l2
    R=64
    L=100
    Alpha=1.2
    Search_T=1

    # Index Search
    K_query=1
    L_query="10 15 20 25 30 35 40 45 50 55 60 65 70 80 90 100 105 110 115 120 125 130"

# Parameter used in filtered index
    #Index Construction
    num_points=100000000
    num_label=50
    filter="50 35"
    distribution_type=random
    universal_label=0
    stitched_R=32
    FilteredLbuild=50

# File path used in normal search
#dataset_path=/home/yujianfu/Desktop/Dataset/
#diskann_path=/home/yujianfu/Desktop/ClusterRepo/DiskANN/
dataset_path=/data/yujian/Dataset/
diskann_path=/home/yujian/DiskANN_filter/

base_vecs_path=${dataset_path}${dataset_name}/${dataset_name}${dataset_size}/${dataset_name}${dataset_size}_base.fvecs
base_bin_path=${dataset_path}${dataset_name}/${dataset_name}${dataset_size}/${dataset_name}${dataset_size}_base.bin
query_vecs_path=${dataset_path}${dataset_name}/${dataset_name}${dataset_size}/${dataset_name}${dataset_size}_query.fvecs
query_bin_path=${dataset_path}${dataset_name}/${dataset_name}${dataset_size}/${dataset_name}${dataset_size}_query.bin
gt_path=${dataset_path}${dataset_name}/${dataset_name}${dataset_size}/${dataset_name}${dataset_size}_GT_${K}
index_path=${diskann_path}index/${dataset_name}/normal/index_${dataset_name}${dataset_size}_R${R}_L${L}_A${Alpha}
result_path=${diskann_path}result/${dataset_name}/normal/

# File path used in filtered search
label_file=${dataset_path}${dataset_name}/${dataset_name}${dataset_size}/labels_${distribution_type}_${num_label}_${dataset_size}.txt
gt_filter_path=${dataset_path}${dataset_name}/${dataset_name}${dataset_size}/${dataset_name}${dataset_size}_GT_${K}_filter_${filter}
index_filter_path=${diskann_path}index/${dataset_name}/filtered/index_filtered_${dataset_name}${dataset_size}_R${R}_L${FilteredLbuild}_A${Alpha}_Uni${universal_label}
index_stitched_path=${diskann_path}index/${dataset_name}/stitched/index_stitched_${dataset_name}${dataset_size}_R${R}_L${L}_StitchedR${stitched_R}_A${Alpha}_Uni${universal_label}
result_filter_path=${diskann_path}result/${dataset_name}/filtered/
result_stitched_path=${diskann_path}result/${dataset_name}/stitched/










