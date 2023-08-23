-- -*- lua -*-
-- vim:ft=lua:et:ts=4

help([[
This module loads HISAT2 version 2.2.1 and python 3.9.14.
]])

whatis("HISAT2")

-- Check if the env var SLURMD_NODENAME exists to indirectly verify if a user
-- is on a compute or transfer node
node_name = os.getenv("SLURMD_NODENAME") or "undefined"
if (node_name == "undefined") then
    LmodError("This package can only be loaded on a compute or transfer node. Please use a SLURM command (srun, sbatch, salloc) to a compute or transfer node.")
end

load('python/3.9.14')

LmodMessage("Loading LIBD module for HISAT2/2.2.1")
prepend_path("PATH", "/jhpce/shared/libd/core/hisat2/2.2.1/hisat2-2.2.1")
