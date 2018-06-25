#!/bin/bash

#SBATCH --time=00:20:00 --mem-per-cpu=256000

module load anaconda3/5.1.0-gpu

date

echo "start"

cd /scratch/cs/imagedb/picsom/databases/vist/download/vist-baseline/

srun python read_hdf5.py

date

echo "end" 