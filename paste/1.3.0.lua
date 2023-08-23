help([[
This module loads paste 1.3.0 for python 3.8.3.
]])

-- Check if the env var SLURMD_NODENAME exists to indirectly verify if a user
-- is on a compute or transfer node
node_name = os.getenv("SLURMD_NODENAME") or "undefined"
if (node_name == "undefined") then
    LmodError("This package can only be loaded on a compute or transfer node. Please use a SLURM command (srun, sbatch, salloc) to a compute or transfer node.")
end

if (mode() == "load") then
    LmodMessage("Loading LIBD module for paste/1.3.0")
elseif (mode() == "unload") then
    LmodMessage("Unloading LIBD module for paste/1.3.0")
end

load('python/3.8.3')

-- Directly activate or deactivate the python virtual environment
execute {cmd="source /jhpce/shared/libd/core/paste/1.3.0/paste_venv/bin/activate", modeA={"load"}}
execute {cmd="deactivate", modeA={"unload"}}
