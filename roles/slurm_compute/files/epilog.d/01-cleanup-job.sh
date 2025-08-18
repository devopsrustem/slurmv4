#!/bin/bash
# roles/slurm_compute/files/epilog.d/01-cleanup-job.sh - Job cleanup script

# Clean up job-specific temp directory
if [ -d "/tmp/slurm-${SLURM_JOB_ID}" ]; then
    rm -rf /tmp/slurm-${SLURM_JOB_ID}
fi

# Log job completion
echo "$(date): Job ${SLURM_JOB_ID} completed by ${SLURM_JOB_USER}" >> /var/log/slurm/job_epilog.log