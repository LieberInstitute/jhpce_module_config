-- -*- lua -*-
-- vim:ft=lua:et:ts=4

help([[
This module loads bfg version 1.13.0.
]])

whatis("bfg")

-- Check if the env var SLURMD_NODENAME exists to indirectly verify if a user
-- is on a compute or transfer node
node_name = os.getenv("SLURMD_NODENAME") or "undefined"
if (node_name == "undefined") then
    LmodError("This package can only be loaded on a compute or transfer node. Please use a SLURM command (srun, sbatch, salloc) to a compute or transfer node.")
end

LmodMessage("Loading LIBD SLURM module for bfg/1.13.0")
prepend_path("PATH", "/jhpce/shared/libd/core/bfg/1.13.0")
LmodMessage("Use with `java -jar /jhpce/shared/libd/core/bfg/1.13.0/bfg.jar`")
