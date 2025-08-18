#!/bin/bash
# roles/slurm_compute/files/prolog.d/01-setup-job.sh - Job setup script

# Set up job environment
export SLURM_JOB_ID=${SLURM_JOB_ID}
export SLURM_JOB_USER=${SLURM_JOB_USER}

# Create job-specific temp directory
mkdir -p /tmp/slurm-${SLURM_JOB_ID}
chown ${SLURM_JOB_USER}:${SLURM_JOB_USER} /tmp/slurm-${SLURM_JOB_ID}

# Set GPU visibility if GPUs allocated
if [ -n "${SLURM_GPUS}" ]; then
    export CUDA_VISIBLE_DEVICES=${SLURM_LOCALID}
fi

# Log job start
echo "$(date): Job ${SLURM_JOB_ID} started by ${SLURM_JOB_USER}" >> /var/log/slurm/job_prolog.log