help([[
This module loads tensorQTL 1.0.8 for python 3.9.0 packaged with conda_R/4.3.
]])

-- Check if the env var SLURMD_NODENAME exists to indirectly verify if a user
-- is on a compute or transfer node
node_name = os.getenv("SLURMD_NODENAME") or "undefined"
if (node_name == "undefined") then
    LmodError("This package can only be loaded on a compute or transfer node. Please use a SLURM command (srun, sbatch, salloc) to a compute or transfer node.")
end

if (mode() == "load") then
    LmodMessage("Loading LIBD module for tensorQTL/1.0.8")
elseif (mode() == "unload") then
    LmodMessage("Unloading LIBD module for tensorQTL/1.0.8")
end

load('conda_R/4.3')

-- Directly activate or deactivate the python virtual environment
execute {cmd="source /jhpce/shared/libd/core/tensorqtl/1.0.8/tensorqtl_venv/bin/activate", modeA={"load"}}
execute {cmd="deactivate", modeA={"unload"}}

-- Seems to be needed for the 'rfunc' module in tensorqtl
prepend_path("LD_LIBRARY_PATH", "/jhpce/shared/jhpce/core/conda/miniconda3-4.11.0/envs/svnR-4.3/R/4.3/lib64/R/lib")

-- Since there is both a module and package/directory named "tensorqtl", (and
-- other modules in the same directory as the "tensorqtl" module), construct the
-- PYTHONPATH such that "import tensorqtl" and "from tensorqtl import *" behave
-- as expected (refer to different "tensorqtl"s). This is necessary because the
-- pip version of 1.0.8 hasn't been released, but the GitHub repo contains the
-- up-to-date 1.0.8 python code
prepend_path("PYTHONPATH", "/jhpce/shared/libd/core/tensorqtl/1.0.8/tensorqtl/tensorqtl")
prepend_path("PYTHONPATH", "/jhpce/shared/libd/core/tensorqtl/1.0.8/tensorqtl")
