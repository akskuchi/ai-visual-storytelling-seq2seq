#!/bin/bash

#SBATCH --time=03:59:00          ## wallclock time hh:mm:ss
#SBATCH --gres=gpushort:teslak80:1    ## one K80 requested

module load anaconda3/5.1.0-gpu

source activate /scratch/cs/imagedb/picsom/databases/vist/conda_vist

cd /scratch/cs/imagedb/picsom/databases/vist/download/vist-baseline

srun --gres=gpushort:1 python data_reader/sis_datareader.py

source deactivate

echo "mapping image features to respective annotations"