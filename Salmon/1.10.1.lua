-- -*- lua -*-
-- vim:ft=lua:et:ts=4

help([[
This module loads Salmon version 1.10.1.
]])

whatis("Salmon")

-- Check if the env var SLURMD_NODENAME exists to indirectly verify if a user
-- is on a compute or transfer node
node_name = os.getenv("SLURMD_NODENAME") or "undefined"
if (node_name == "undefined") then
    LmodError("This package can only be loaded on a compute or transfer node. Please use a SLURM command (srun, sbatch, salloc) to a compute or transfer node.")
end

if (mode() == "load") then
    LmodMessage("Loading LIBD module for Salmon/1.10.1")
elseif (mode() == "unload") then
    LmodMessage("Unloading LIBD module for Salmon/1.10.1")
end

prepend_path("PATH", "/jhpce/shared/libd/core/Salmon/1.10.1/bin")
