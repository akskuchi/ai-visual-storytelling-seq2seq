#!/bin/bash

#SBATCH --time=02:00:00 --mem-per-cpu=32000
#SBATCH --gres=gpu:1

module load anaconda3/5.1.0-gpu CUDA/9.0.176 cuDNN/6.0-CUDA-8.0.61

source activate /scratch/cs/imagedb/picsom/databases/vist/conda_vist

date

echo "start"

cd /scratch/cs/imagedb/picsom/databases/vist/download/vist-baseline

srun python dataset/models/alexnet/myalexnet_forward_newtf.py #split_12

OUT=$?
if [ $OUT -eq 0 ];then
   echo "extracted features of images using AlexNet"
else
   echo "something broke"
fi

echo "end"

source deactivate

date
