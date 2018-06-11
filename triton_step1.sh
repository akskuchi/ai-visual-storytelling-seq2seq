#!/bin/bash

#SBATCH --time=02:00:00          ## wallclock time hh:mm:ss
#SBATCH --gres=gpu:4    ## one K80 requested

module load anaconda3/5.1.0-gpu CUDA/9.0.176 cuDNN/6.0-CUDA-8.0.61

source activate /scratch/cs/imagedb/picsom/databases/vist/conda_vist

pip list

cd /scratch/cs/imagedb/picsom/databases/vist/download/vist-baseline

srun --gres=gpu:2 python dataset/models/alexnet/myalexnet_forward_newtf.py

source deactivate

echo "extracted features of images using AlexNet"