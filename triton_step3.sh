#!/bin/bash

#SBATCH --time=15:30:00 --mem-per-cpu=128000
#SBATCH --gres=gpu:teslap100:4 

module load anaconda3/5.1.0-gpu CUDA/9.0.176 cuDNN/6.0-CUDA-8.0.61

source activate /scratch/cs/imagedb/picsom/databases/vist/conda_vist

date

echo "start"

cd /scratch/cs/imagedb/picsom/databases/vist/download/vist-baseline

srun python training_model.py

OUT=$?
if [ $OUT -eq 0 ];then
   echo "training complete, generate stories"
else
   echo "something broke"
fi

source deactivate

date
