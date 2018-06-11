#!/bin/bash

#SBATCH --time=03:15:00          ## wallclock time hh:mm:ss
#SBATCH --gres=gpu:teslak80:1    ## one K80 requested

module load anaconda3/5.1.0-gpu

source activate /scratch/cs/imagedb/picsom/databases/vist/conda_vist

cd /scratch/cs/imagedb/picsom/databases/vist/download/vist-baseline

srun --gres=gpu:1 python training_model.py

source deactivate

echo "trained model"
