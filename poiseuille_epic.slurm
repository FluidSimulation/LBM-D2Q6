#!/usr/bin/bash
#SBATCH --partition=EPIC2
#SBATCH --time=01:30:00
#SBATCH --nodes=4
#SBATCH --ntasks-per-node=2
#SBATCH --gres=gpu:2  
#SBATCH --job-name="LBM_Poiseuille"
#SBATCH --output=lbm_cuda.%j.out

cd ${SLURM_SUBMIT_DIR}
. environment.sh epic

# Poiseuille
export CFLAGS=-DWITH_GEOMETRY=0

make clean all
export OUTPUT_DIR="data_${ARCH}"
export PROGRAM="./hybrid_${ARCH}"
mkdir -p ${OUTPUT_DIR}
srun --mpi=pmi2 ${PROGRAM} -o ${OUTPUT_DIR}
