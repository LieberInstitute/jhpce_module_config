help([[
This module loads DISSECT (GitHub commit dc45940c).
]])

-- Check if the env var SLURMD_NODENAME exists to indirectly verify if a user
-- is on a compute or transfer node
node_name = os.getenv("SLURMD_NODENAME") or "undefined"
if (node_name == "undefined") then
    LmodError("This package can only be loaded on a compute or transfer node. Please use a SLURM command (srun, sbatch, salloc) to a compute or transfer node.")
end

if (mode() == "load") then
    LmodMessage("Loading LIBD SLURM module for dissect/dc45940c")
elseif (mode() == "unload") then
    LmodMessage("Unloading LIBD SLURM module for dissect/dc45940c")
end

-- Directly activate or deactivate the conda environment
always_load("conda/3-23.3.1")
execute {cmd="conda activate /jhpce/shared/libd/core/dissect/dc45940c/dissect_env", modeA={"load"}}
execute {cmd="conda deactivate", modeA={"unload"}}

-- For finding python scripts from the DISSECT repo
append_path('PATH', '/jhpce/shared/libd/core/dissect/dc45940c/DISSECT')
append_path('PYTHONPATH', '/jhpce/shared/libd/core/dissect/dc45940c/DISSECT')

-- Don't try to depend on user-installed python packages
setenv("PYTHONNOUSERSITE", "anything")
