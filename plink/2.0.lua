-- -*- lua -*-
-- vim:ft=lua:et:ts=4

help([[
This module loads plink version 2.00 alpha.
]])

whatis("plink")

-- Check if the env var SLURMD_NODENAME exists to indirectly verify if a user
-- is on a compute or transfer node
node_name = os.getenv("SLURMD_NODENAME") or "undefined"
if (node_name == "undefined") then
    LmodError("This package can only be loaded on a compute or transfer node. Please use a SLURM command (srun, sbatch, salloc) to a compute or transfer node.")
end

LmodMessage("Loading LIBD module for plink/2.0")
LmodMessage("Plink is invoked with the command 'plink2'.")
prepend_path("PATH", "/jhpce/shared/libd/core/plink/2.0")
