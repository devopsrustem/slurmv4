#!/bin/bash
# roles/slurm_compute/files/prolog.d/01-setup-job.sh - Job setup script

# Validate required SLURM environment variables
[ -z "${SLURM_JOB_ID}" ] && { echo "Error: SLURM_JOB_ID not set"; exit 1; }
[ -z "${SLURM_JOB_USER}" ] && { echo "Error: SLURM_JOB_USER not set"; exit 1; }

# Create job-specific temp directory
mkdir -p "/tmp/slurm-${SLURM_JOB_ID}"
chown "${SLURM_JOB_USER}:${SLURM_JOB_USER}" "/tmp/slurm-${SLURM_JOB_ID}"

# Set GPU visibility if GPUs allocated
if [ -n "${SLURM_GPUS}" ]; then
    export CUDA_VISIBLE_DEVICES=${SLURM_LOCALID}
fi

# Log job start
echo "$(date): Job ${SLURM_JOB_ID} started by ${SLURM_JOB_USER}" >> /var/log/slurm/job_prolog.log