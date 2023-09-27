-- -*- lua -*-
-- vim:ft=lua:et:ts=4

help([[This module loads plink version 1.90 beta]])

whatis("plink")

-- Check if the env var SLURMD_NODENAME exists to indirectly verify if a user
-- is on a compute or transfer node
node_name = os.getenv("SLURMD_NODENAME") or "undefined"
if (node_name == "undefined") then
    LmodError("This package can only be loaded on a compute or transfer node. Please use a SLURM command (srun, sbatch, salloc) to a compute or transfer node.")
end

if (mode() == "load") then
    LmodMessage("Loading LIBD module for plink/1.90b")
    LmodMessage("Plink 1.9 is invoked with the command 'plink'.")
elseif (mode() == "unload") then
    LmodMessage("Unloading LIBD module for plink/1.90b")
end

prepend_path("PATH", "/jhpce/shared/libd/core/plink/1.90b")
