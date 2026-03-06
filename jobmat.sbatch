#!/bin/bash
#SBATCH -o logs/%x/%A_%a.out
#SBATCH -e logs/%x/%A_%a.err
#SBATCH -t 30-00:00:00
#SBATCH --nodes=1
#SBATCH --ntasks-per-node=1
#SBATCH --cpus-per-gpu=16
#SBATCH --mem-per-gpu=64G
#SBATCH --gres=gpu:1
#SBATCH -J jobmat
#SBATCH --array=0-0

# for env debugging
echo "CUDA_VISIBLE_DEVICES: $CUDA_VISIBLE_DEVICES"
python slurm/src/check_env.py

X_ARR=("x0")
Y_ARR=("y0")

set -e
set -x

xs=${#X_ARR[@]}

xid=$((SLURM_ARRAY_TASK_ID % xs))
yid=$((SLURM_ARRAY_TASK_ID / xs))

x=${X_ARR[$xid]}
y=${Y_ARR[$yid]}

# TODO: run here
