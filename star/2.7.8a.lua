-- -*- lua -*-
-- vim:ft=lua:et:ts=4

help([[
This module loads STAR version 2.7.8a.
]])

whatis("STAR")

-- Check if the env var SLURMD_NODENAME exists to indirectly verify if a user
-- is on a compute or transfer node
node_name = os.getenv("SLURMD_NODENAME") or "undefined"
if (node_name == "undefined") then
    LmodError("This package can only be loaded on a compute or transfer node. Please use a SLURM command (srun, sbatch, salloc) to a compute or transfer node.")
end

if (mode() == "load") then
    LmodMessage("Loading LIBD module for star/2.7.8a")
elseif (mode() == "unload") then
    LmodMessage("Unloading LIBD module for star/2.7.8a")
end

prepend_path("PATH", "/jhpce/shared/libd/core/star/2.7.8a/STAR-2.7.8a/bin/Linux_x86_64_static")
