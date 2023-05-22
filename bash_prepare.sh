#!/bin/bash

source ./bash_parameter.sh


echo "##########################Transfer the format of base file and query file from vecs to bin##########################"
echo ${base_vecs_path}
echo ${base_bin_path}
echo ${query_vecs_path}
echo ${query_bin_path}
#./build/tests/utils/fvecs_to_bin ${data_type} ${base_vecs_path} ${base_bin_path}
#./build/tests/utils/fvecs_to_bin ${data_type} ${query_vecs_path} ${query_bin_path}

if [ $Target_task = "normal"  -o  $Target_task = "all" ]; then

echo "##########################Compute the groundtruth of normal search##########################"
./build/tests/utils/compute_groundtruth  --data_type ${data_type} --dist_fn ${dist_fn} --base_file ${base_bin_path} --query_file  ${query_bin_path} --gt_file ${gt_path} --K ${K}

fi

if [ $Target_task = "filtered"  -o  $Target_task = "stitched"  -o  $Target_task = "all" ]; then

echo "##########################Generate synthetic label for filtered search##########################"
./build/tests/utils/generate_synthetic_labels  --num_labels ${num_label} --num_points ${num_points}  --output_file ${label_file} --distribution_type ${distribution_type}

echo "##########################Compute the groundtruth for filtered search##########################"
build/tests/utils/compute_groundtruth_for_filters --data_type ${data_type} --dist_fn ${dist_fn} --base_file ${base_bin_path} --query_file ${query_bin_path} --gt_file ${gt_filter_path} --K ${K} --label_file ${label_file} --filter_label ${filter} --universal_label ${universal_label}

fi