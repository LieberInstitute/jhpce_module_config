help([[
This module loads SpaGCN 1.2.0 for python 3.7.3.
]])

-- Check if the env var SLURMD_NODENAME exists to indirectly verify if a user
-- is on a compute or transfer node
node_name = os.getenv("SLURMD_NODENAME") or "undefined"
if (node_name == "undefined") then
    LmodError("This package can only be loaded on a compute or transfer node. Please use a SLURM command (srun, sbatch, salloc) to a compute or transfer node.")
end

LmodMessage("Loading LIBD module for spagcn/1.2.0")

load('python/3.7.3')
prepend_path("PATH", "/jhpce/shared/libd/core/spagcn/1.2.0/spagcn_venv/bin")

-- Don't try to depend on user-installed python packages
setenv("PYTHONNOUSERSITE", "anything")
