#!/usr/bin/bash
#SBATCH --partition=EPIC2
#SBATCH --time=01:30:00
#SBATCH --nodes=4
#SBATCH --ntasks-per-node=5
#SBATCH --cpus-per-task=4
#SBATCH --job-name="LBM_Cylinder"
#SBATCH --output=lbm_intel.%j.out

cd ${SLURM_SUBMIT_DIR}
. environment.sh idun

# Cylinder
export CFLAGS="-DWITH_GEOMETRY=2 -DSCALE=5"

export OMP_NUM_THREADS=${SLURM_CPUS_PER_TASK}

make clean all
export OUTPUT_DIR="data_${ARCH}"
export PROGRAM="./hybrid_${ARCH}"
mkdir -p ${OUTPUT_DIR}
time srun --mpi=pmi2 ${PROGRAM} -o ${OUTPUT_DIR}
