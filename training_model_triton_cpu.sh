#!/bin/bash

#SBATCH -p batch
#SBATCH --time=11:00:00      # 10 hours
#SBATCH --mem-per-cpu=64000   # 64G of memory

module load anaconda2/latest

source activate /scratch/cs/imagedb/picsom/databases/vist/conda_vist

cd /scratch/cs/imagedb/picsom/databases/vist/download/vist-baseline

srun python training_model.py

source deactivate