#!/bin/bash
#SBATCH --job-name=DeMatrix
#SBATCH --output=matrix.out
#SBATCH --error=matrix.err
#SBATCH --nodes=4
#SBATCH --ntasks-per-node=1

MACHINEFILE="nodes.$SLURM_JOBID"

srun -l /bin/hostname | sort -n | awk '{print $2}' > $MACHINEFILE

mpiexec.hydra --bootstrap slurm -f $MACHINEFILE -genv I_MPI_FABRICS=shm:tcp ./matrix

