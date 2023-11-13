-- -*- lua -*-
-- vim:ft=lua:et:ts=4

help([[
This module loads cellranger-arc 2.0.2.
]])

-- Check if the env var SLURMD_NODENAME exists to indirectly verify if a user
-- is on a compute or transfer node
node_name = os.getenv("SLURMD_NODENAME") or "undefined"
if (node_name == "undefined") then
    LmodError("This package can only be loaded on a compute or transfer node. Please use a SLURM command (srun, sbatch, salloc) to a compute or transfer node.")
end

if (mode() == "load") then
    LmodMessage("Loading LIBD SLURM module for cellranger_arc/2.0.2")
    LmodMessage("Reference files, for use with the '--transcriptome' argument, can be accessed or downloaded into /dcs04/lieber/lcolladotor/annotationFiles_LIBD001/10x.")
elseif (mode() == "unload") then
    LmodMessage("Unloading LIBD SLURM module for cellranger_arc/2.0.2")
end

prepend_path("PATH", "/jhpce/shared/libd/core/cellranger_arc/2.0.2/cellranger-arc-2.0.2")
