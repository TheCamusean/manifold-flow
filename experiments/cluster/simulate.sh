#!/bin/bash

#SBATCH --job-name=sim
#SBATCH --output=log_simulate.log
#SBATCH --nodes=1
#SBATCH --cpus-per-task=1
#SBATCH --mem=64GB
#SBATCH --time=7-00:00:00
# #SBATCH --gres=gpu:1

source activate ml
export OMP_NUM_THREADS=1
cd /scratch/jb6504/manifold-flow/experiments

# python -u generate_data.py --dataset spherical_gaussian --epsilon 0.001 --dir /scratch/jb6504/manifold-flow
# python -u generate_data.py --dataset spherical_gaussian --epsilon 0.01 --dir /scratch/jb6504/manifold-flow
# python -u generate_data.py --dataset spherical_gaussian --epsilon 0.1 --dir /scratch/jb6504/manifold-flow
python -u generate_data.py --dataset spherical_gaussian --epsilon 0.001 --train 0 --test 0 --ood 10000 --dir /scratch/jb6504/manifold-flow
python -u generate_data.py --dataset spherical_gaussian --epsilon 0.01 --train 0 --test 0 --ood 10000 --dir /scratch/jb6504/manifold-flow
python -u generate_data.py --dataset spherical_gaussian --epsilon 0.1 --train 0 --test 0 --ood 10000 --dir /scratch/jb6504/manifold-flow

# python -u generate_data.py --dataset conditional_spherical_gaussian --epsilon 0.001 --dir /scratch/jb6504/manifold-flow
# python -u generate_data.py --dataset conditional_spherical_gaussian --epsilon 0.01 --dir /scratch/jb6504/manifold-flow
# python -u generate_data.py --dataset conditional_spherical_gaussian --epsilon 0.1 --dir /scratch/jb6504/manifold-flow
