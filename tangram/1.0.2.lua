help([[
This module loads tangram 1.0.2 for python 3.8.12.
]])

-- Check if the env var SLURMD_NODENAME exists to indirectly verify if a user
-- is on a compute or transfer node
node_name = os.getenv("SLURMD_NODENAME") or "undefined"
if (node_name == "undefined") then
    LmodError("This package can only be loaded on a compute or transfer node. Please use a SLURM command (srun, sbatch, salloc) to a compute or transfer node.")
end

LmodMessage("Loading LIBD module for tangram/1.0.2")

prepend_path("PATH", "/jhpce/shared/libd/core/tangram/1.0.2/tangram_env/bin")
