-- -*- lua -*-
-- vim:ft=lua:et:ts=4

help([[
This module loads samblaster v0.1.26.
]])

-- Check if the env var SLURMD_NODENAME exists to indirectly verify if a user
-- is on a compute or transfer node
node_name = os.getenv("SLURMD_NODENAME") or "undefined"
if (node_name == "undefined") then
    LmodError("This package can only be loaded on a compute or transfer node. Please use a SLURM command (srun, sbatch, salloc) to a compute or transfer node.")
end

if (mode() == "load") then
    LmodMessage("Loading LIBD SLURM module for samblaster/0.1.26")
elseif (mode() == "unload") then
    LmodMessage("Unloading LIBD SLURM module for samblaster/0.1.26")
end

prepend_path("PATH", "/jhpce/shared/libd/core/samblaster/0.1.26/samblaster-v.0.1.26")
