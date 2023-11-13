-- -*- lua -*-
-- vim:ft=lua:et:ts=4

help([[
This module loads MAGMA version 1.10.
]])

-- Check if the env var SLURMD_NODENAME exists to indirectly verify if a user
-- is on a compute or transfer node
node_name = os.getenv("SLURMD_NODENAME") or "undefined"
if (node_name == "undefined") then
    LmodError("This package can only be loaded on a compute or transfer node. Please use a SLURM command (srun, sbatch, salloc) to a compute or transfer node.")
end

if (mode() == "load") then
    LmodMessage("Loading LIBD SLURM module for magma/1.10")
elseif (mode() == "unload") then
    LmodMessage("Unloading LIBD SLURM module for magma/1.10")
end

prepend_path("PATH", "/jhpce/shared/libd/core/magma/1.10")
