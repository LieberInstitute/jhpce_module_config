help([[
This module loads VAMPIRE version 3.4.4 and python 3.6.9.
]])

-- Check if the env var SLURMD_NODENAME exists to indirectly verify if a user
-- is on a compute or transfer node
node_name = os.getenv("SLURMD_NODENAME") or "undefined"
if (node_name == "undefined") then
    LmodError("This package can only be loaded on a compute or transfer node. Please use a SLURM command (srun, sbatch, salloc) to a compute or transfer node.")
end

LmodMessage("Loading LIBD SLURM module for vampire/3.4.4")

load('python/3.6.9')
prepend_path("PYTHONPATH", "/jhpce/shared/libd/core/vampire/3.4.4/vampire/bin/lib/python3.6/site-packages")
prepend_path("PATH", "/jhpce/shared/libd/core/vampire/3.4.4/vampire/bin/bin")

-- Don't try to depend on user-installed python packages
setenv("PYTHONNOUSERSITE", "anything")
