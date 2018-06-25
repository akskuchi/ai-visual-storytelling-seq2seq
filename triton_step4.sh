#!/bin/bash

#SBATCH --time=02:00:00 --mem-per-cpu=32000
#SBATCH --gres=gpu:1

module load anaconda3/5.1.0-gpu CUDA/9.0.176 cuDNN/6.0-CUDA-8.0.61

source activate /scratch/cs/imagedb/picsom/databases/vist/conda_vist

date

echo "start"

cd /scratch/cs/imagedb/picsom/databases/vist/download/vist-baseline

srun python inference_model.py

source deactivate

date

echo "end"

echo "stories generated for val dataset"
