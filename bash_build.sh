#!/bin/bash
source ./bash_parameter.sh


if [ $Target_task = "normal"  -o  $Target_task = "all" ]; then

echo "##########################Build normal index##########################"
echo ${base_bin_path}
echo ${index_path}
echo ${L}
echo ${R}
echo ${Alpha}
./build/tests/build_memory_index  --data_type ${data_type} --dist_fn ${dist_fn} --data_path ${base_bin_path} --index_path_prefix ${index_path} -R ${R} -L ${L} --alpha ${Alpha}

fi

if [ $Target_task = "filtered"  -o  $Target_task = "all" ]; then

echo "##########################Build index with filters##########################"
./build/tests/build_memory_index  --data_type ${data_type} --dist_fn ${dist_fn} --data_path ${base_bin_path} --index_path_prefix ${index_filter_path} -R ${R} --FilteredLbuild ${FilteredLbuild} --alpha ${Alpha} --label_file ${label_file} --universal_label ${universal_label}

fi

if [ $Target_task = "stitched"  -o  $Target_task = "all" ]; then

echo "##########################Build index with stitched index##########################"
./build/tests/build_stitched_index --data_type ${data_type} --data_path ${base_bin_path} --index_path_prefix ${index_stitched_path} -R ${R} -L ${L} --stitched_R ${stitched_R} --alpha ${Alpha} --label_file ${label_file} --universal_label ${universal_label}

fi


