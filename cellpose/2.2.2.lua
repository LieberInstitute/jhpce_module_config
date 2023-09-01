help([[This module loads cellpose 2.2.2 for CUDA 11.3.]])

-- Check if the env var SLURMD_NODENAME exists to indirectly verify if a user
-- is on a compute or transfer node
node_name = os.getenv("SLURMD_NODENAME") or "undefined"
if (node_name == "undefined") then
    LmodError("This package can only be loaded on a compute or transfer node. Please use a SLURM command (srun, sbatch, salloc) to a compute or transfer node.")
end

if (mode() == "load") then
    LmodMessage("Loading LIBD module for cellpose/2.2.2")
elseif (mode() == "unload") then
    LmodMessage("Unloading LIBD module for cellpose/2.2.2")
end

-- Directly activate or deactivate the conda environment. Here we directly
-- source conda-related code to circumvent the need for 'conda init', which is
-- user dependent
execute {cmd="source /jhpce/shared/jhpce/core/conda/miniconda3-23.3.1/etc/profile.d/conda.sh", modeA={"load"}}
execute {cmd="conda activate /jhpce/shared/libd/core/cellpose/2.2.2/cellpose_env", modeA={"load"}}
execute {cmd="conda deactivate", modeA={"unload"}}

-- Manually add a directory to the library path
prepend_path(
    "LD_LIBRARY_PATH", "/jhpce/shared/libd/core/cellpose/2.2.2/cellpose_env/lib"
)