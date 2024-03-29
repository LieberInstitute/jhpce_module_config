-- -*- lua -*-
-- vim:ft=lua:et:ts=4

help([[
This module loads space ranger version 2.1.0.
]])

-- Check if the env var SLURMD_NODENAME exists to indirectly verify if a user
-- is on a compute or transfer node
node_name = os.getenv("SLURMD_NODENAME") or "undefined"
if (node_name == "undefined") then
    LmodError("This package can only be loaded on a compute or transfer node. Please use a SLURM command (srun, sbatch, salloc) to a compute or transfer node.")
end

if (mode() == "load") then
    LmodMessage("Loading LIBD SLURM module for spaceranger/2.1.0")
    LmodMessage("Reference files, for use with the '--transcriptome' argument, can be accessed or downloaded into /dcs04/lieber/lcolladotor/annotationFiles_LIBD001/10x.")
elseif (mode() == "unload") then
    LmodMessage("Unloading LIBD SLURM module for spaceranger/2.1.0")
end

prepend_path("PATH", "/jhpce/shared/libd/core/spaceranger/2.1.0/spaceranger-2.1.0")
