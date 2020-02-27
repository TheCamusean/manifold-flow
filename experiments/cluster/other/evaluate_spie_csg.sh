#!/bin/bash

#SBATCH --job-name=e-spie-csg
#SBATCH --output=log_evaluate_spie_csg_%a.log
#SBATCH --nodes=1
#SBATCH --cpus-per-task=1
#SBATCH --mem=32GB
#SBATCH --time=7-00:00:00
# #SBATCH --gres=gpu:1

source activate ml
export OMP_NUM_THREADS=1
cd /scratch/jb6504/manifold-flow/experiments

python -u evaluate.py --modelname small_shallow_long --dataset conditional_spherical_gaussian --algorithm pie --specified  --epsilon 0.01  --outerlayers 3 --innerlayers 3 -i ${SLURM_ARRAY_TASK_ID} --dir /scratch/jb6504/manifold-flow
python -u evaluate.py --modelname small_shallow_long --dataset conditional_spherical_gaussian --algorithm pie --specified  --epsilon 0.001  --outerlayers 3 --innerlayers 3 -i ${SLURM_ARRAY_TASK_ID} --dir /scratch/jb6504/manifold-flow
python -u evaluate.py --modelname small_shallow_long --dataset conditional_spherical_gaussian --algorithm pie --specified  --epsilon 0.1  --outerlayers 3 --innerlayers 3 -i ${SLURM_ARRAY_TASK_ID} --dir /scratch/jb6504/manifold-flow

python -u evaluate.py --modelname small_long --dataset conditional_spherical_gaussian --algorithm pie --specified  --epsilon 0.01  -i ${SLURM_ARRAY_TASK_ID} --dir /scratch/jb6504/manifold-flow
python -u evaluate.py --modelname small_long --dataset conditional_spherical_gaussian --algorithm pie --specified  --epsilon 0.001  -i ${SLURM_ARRAY_TASK_ID} --dir /scratch/jb6504/manifold-flow
python -u evaluate.py --modelname small_long --dataset conditional_spherical_gaussian --algorithm pie --specified  --epsilon 0.1  -i ${SLURM_ARRAY_TASK_ID} --dir /scratch/jb6504/manifold-flow

python -u evaluate.py --modelname small --dataset conditional_spherical_gaussian --algorithm pie --specified --epsilon 0.01 -i ${SLURM_ARRAY_TASK_ID} --dir /scratch/jb6504/manifold-flow
python -u evaluate.py --modelname small --dataset conditional_spherical_gaussian --algorithm pie --specified --epsilon 0.001 -i ${SLURM_ARRAY_TASK_ID} --dir /scratch/jb6504/manifold-flow
python -u evaluate.py --modelname small --dataset conditional_spherical_gaussian --algorithm pie --specified --epsilon 0.1 -i ${SLURM_ARRAY_TASK_ID} --dir /scratch/jb6504/manifold-flow