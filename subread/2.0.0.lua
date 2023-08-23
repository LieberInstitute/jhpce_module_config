-- -*- lua -*-
-- vim:ft=lua:et:ts=4

help([[
This module loads Subread version 2.0.0.
]])

whatis("featureCounts")

-- Check if the env var SLURMD_NODENAME exists to indirectly verify if a user
-- is on a compute or transfer node
node_name = os.getenv("SLURMD_NODENAME") or "undefined"
if (node_name == "undefined") then
    LmodError("This package can only be loaded on a compute or transfer node. Please use a SLURM command (srun, sbatch, salloc) to a compute or transfer node.")
end

if (mode() == "load") then
    LmodMessage("Loading LIBD module for Subread/2.0.0")
elseif (mode() == "unload") then
    LmodMessage("Unloading LIBD module for Subread/2.0.0")
end

prepend_path("PATH", "/jhpce/shared/libd/core/subread/2.0.0/subread-2.0.0-Linux-x86_64/bin")
