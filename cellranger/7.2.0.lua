-- -*- lua -*-
-- vim:ft=lua:et:ts=4

help([[
This module loads cell ranger version 7.2.0.
]])

-- Check if the env var SLURMD_NODENAME exists to indirectly verify if a user
-- is on a compute or transfer node
node_name = os.getenv("SLURMD_NODENAME") or "undefined"
if (node_name == "undefined") then
    LmodError("This package can only be loaded on a compute or transfer node. Please use a SLURM command (srun, sbatch, salloc) to a compute or transfer node.")
end

LmodMessage("Loading LIBD SLURM module for cellranger/7.2.0")
LmodMessage("Reference files, for use with the '--transcriptome' argument, can be accessed or downloaded into /dcs04/lieber/lcolladotor/annotationFiles_LIBD001/10x.")
prepend_path("PATH", "/jhpce/shared/libd/core/cellranger/7.2.0/cellranger-7.2.0")
