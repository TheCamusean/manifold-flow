#!/bin/bash

conda activate ml
dir=/Users/johannbrehmer/work/projects/manifold_flow/manifold-flow
cd $dir/experiments

for i in 5 6 7 8 9
do
    python evaluate.py -c configs/evaluate_pie_gan2d_april.config -i $i
done
