#!/bin/bash

#SBATCH --time=00:45:00 --mem-per-cpu=256000

module load anaconda3/5.1.0-gpu CUDA/9.0.176 cuDNN/6.0-CUDA-8.0.61

source activate /scratch/cs/imagedb/picsom/databases/vist/conda_vist

date

echo "start"

cd /scratch/cs/imagedb/picsom/databases/vist/download/vist-baseline

srun python data_reader/sis_datareader.py train/split_11

OUT=$?
if [ $OUT -eq 0 ];then
   echo "mapping image features to respective annotations done"
else
   echo "something broke"
fi

echo "end"

source deactivate

date