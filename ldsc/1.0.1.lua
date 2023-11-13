-- -*- lua -*-
-- vim:ft=lua:et:ts=4

help([[
This module loads LDSC version 1.0.1.
]])

-- Check if the env var SLURMD_NODENAME exists to indirectly verify if a user
-- is on a compute or transfer node
node_name = os.getenv("SLURMD_NODENAME") or "undefined"
if (node_name == "undefined") then
    LmodError("This package can only be loaded on a compute or transfer node. Please use a SLURM command (srun, sbatch, salloc) to a compute or transfer node.")
end

LmodMessage("Loading LIBD SLURM module for LDSC/1.0.1")
load('python/3.7.3')
prepend_path("PATH", "/jhpce/shared/libd/core/ldsc/1.0.1/ldsc")
setenv('OPENBLAS_NUM_THREADS', 1)
