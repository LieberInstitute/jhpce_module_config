
-- -*- lua -*-
-- vim:ft=lua:et:ts=4

help([[
This module loads qctools version 2.0.7
]])

whatis("qctool")

-- Check if the env var SLURMD_NODENAME exists to indirectly verify if a user
-- is on a compute or transfer node
node_name = os.getenv("SLURMD_NODENAME") or "undefined"
if (node_name == "undefined") then
    LmodError("This package can only be loaded on a compute or transfer node. Please use a SLURM command (srun, sbatch, salloc) to a compute or transfer node.")
end

LmodMessage("Loading LIBD module for qctool/2.0.7")
prepend_path("PATH", "/jhpce/shared/libd/core/qctool/2.0.7/qctool/build/release/")