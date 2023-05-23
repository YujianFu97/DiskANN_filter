#!/bin/bash

source ./bash_parameter.sh

if [ $Target_task = "normal"  -o  $Target_task = "all" ]; then

echo "##########################Search normal index##########################"
./build/tests/search_memory_index  --data_type ${data_type} --dist_fn ${dist_fn} --index_path_prefix ${index_path} --query_file ${query_bin_path}  --gt_file ${gt_path} -K ${K_query} -L ${L_query} --result_path ${result_path} --T ${Search_T}

fi

if [ $Target_task = "filtered"  -o  $Target_task = "all" ]; then

echo "##########################Search filtered index##########################"
./build/tests/search_memory_index  --data_type ${data_type} --dist_fn ${dist_fn} --index_path_prefix ${index_filter_path} --query_file ${query_bin_path} --gt_file ${gt_filter_path} --filter_label ${filter} -K ${K_query} -L ${L_query} --result_path ${result_filter_path}

fi

if [ $Target_task = "stitched"  -o  $Target_task = "all" ]; then

echo "##########################Search stitched index##########################"
./build/tests/search_memory_index  --data_type ${data_type} --dist_fn ${dist_fn} --index_path_prefix ${index_stitched_path} --query_file ${query_bin_path} --gt_file ${gt_filter_path} --filter_label ${filter} -K ${K_query} -L ${L_query} --result_path ${result_stitched_path}

fi
