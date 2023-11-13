-- -*- lua -*-
-- vim:ft=lua:et:ts=4

help([[This module loads MethylDackel 0.5.2.]])

-- Check if the env var SLURMD_NODENAME exists to indirectly verify if a user
-- is on a compute or transfer node
node_name = os.getenv("SLURMD_NODENAME") or "undefined"
if (node_name == "undefined") then
    LmodError("This package can only be loaded on a compute or transfer node. Please use a SLURM command (srun, sbatch, salloc) to a compute or transfer node.")
end

if (mode() == "load") then
    LmodMessage("Loading LIBD SLURM module for methyldackel/0.5.2")
    LmodMessage("Note that the software is invoked as 'MethylDackel', not 'methyldackel'.")
elseif (mode() == "unload") then
    LmodMessage("Unloading LIBD SLURM module for methyldackel/0.5.2")
end

prepend_path("PATH", "/jhpce/shared/libd/core/methyldackel/0.5.2")
prepend_path("LD_LIBRARY_PATH", "/jhpce/shared/libd/core/methyldackel/0.5.2/lib")
