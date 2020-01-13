#!/bin/bash

#SBATCH --job-name=t-smf-csg
#SBATCH --output=log_train_smf_csg_%a.log
#SBATCH --nodes=1
#SBATCH --cpus-per-task=1
#SBATCH --mem=32GB
#SBATCH --time=7-00:00:00
#SBATCH --gres=gpu:1

module load cuda/10.1.105
source activate ml
cd /scratch/jb6504/manifold-flow/experiments

case ${SLURM_ARRAY_TASK_ID} in
0) python -u train.py --dataset conditional_spherical_gaussian --algorithm mf --specified --outercouplingmlp --outercouplinglayers 1 --epochs 12 --epsilon 0.01 --dir /scratch/jb6504/manifold-flow  --debug ;;
1) python -u train.py --dataset conditional_spherical_gaussian --algorithm mf --specified --outercouplingmlp --outercouplinglayers 1 --epochs 12 --epsilon 0.001 --dir /scratch/jb6504/manifold-flow ;;
2) python -u train.py --dataset conditional_spherical_gaussian --algorithm mf --specified --outercouplingmlp --outercouplinglayers 1 --epochs 12 --epsilon 0.1 --dir /scratch/jb6504/manifold-flow ;;
*) echo "Nothing to do for job ${SLURM_ARRAY_TASK_ID}" ;;
esac