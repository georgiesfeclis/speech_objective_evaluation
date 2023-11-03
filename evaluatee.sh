#!/bin/bash

# List of values
values=(
08F
09F
15F
18M
25M
28M
33F
34M
36F
41M
44F
45F
49F
54M
55F
56M
58F
)

# Base MATLAB command
base_command="matlab -nodisplay -nosplash -nodesktop -nojvm -r"

# Loop through the list and execute the command for each value
for val in "${values[@]}"; do
    cmd="$base_command \"addpath('/gpfs/home/cdn16hqu/tcd_timit_basic/results/'); evaluateEnhancedAudioPrefix('/gpfs/home/cdn16hqu/NTCD_TIMIT/clean/test/', '/gpfs/home/cdn16hqu/tcd_timit_basic/results/tcd_lstm_16088770/enhanced', 16000, '$val'); exit;\""
    echo "Running command for $val"
    eval $cmd
done

