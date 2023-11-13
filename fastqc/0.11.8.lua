-- -*- lua -*-
-- vim:ft=lua:et:ts=4

help([[
This module loads FastQC version 0.11.8.
]])

whatis("FastQC")

-- Check if the env var SLURMD_NODENAME exists to indirectly verify if a user
-- is on a compute or transfer node
node_name = os.getenv("SLURMD_NODENAME") or "undefined"
if (node_name == "undefined") then
    LmodError("This package can only be loaded on a compute or transfer node. Please use a SLURM command (srun, sbatch, salloc) to a compute or transfer node.")
end

if (mode() == "load") then
    LmodMessage("Loading LIBD SLURM module for FastQC/0.11.8")
elseif (mode() == "unload") then
    LmodMessage("Unloading LIBD SLURM module for FastQC/0.11.8")
end
prepend_path("PATH", "/jhpce/shared/libd/core/FastQC/0.11.8/FastQC")
