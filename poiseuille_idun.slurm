#!/usr/bin/bash
#SBATCH --partition=EPIC2
#SBATCH --time=01:30:00
#SBATCH --nodes=4
#SBATCH --ntasks-per-node=5
#SBATCH --cpus-per-task=4
#SBATCH --job-name="LBM_Poiseuille"
#SBATCH --output=lbm_intel.%j.out

cd ${SLURM_SUBMIT_DIR}
. environment.sh idun

# Poiseuille
export CFLAGS="-DWITH_GEOMETRY=0 -DSCALE=5"

make clean all
export OUTPUT_DIR="data_${ARCH}"
export PROGRAM="./hybrid_${ARCH}"
mkdir -p ${OUTPUT_DIR}
srun --mpi=pmi2 ${PROGRAM} -o ${OUTPUT_DIR}
