-- -*- lua -*-
-- vim:ft=lua:et:ts=4

help([[
This module loads RSeQC version 3.0.1.
]])

whatis("RSeQC")

-- Check if the env var SLURMD_NODENAME exists to indirectly verify if a user
-- is on a compute or transfer node
node_name = os.getenv("SLURMD_NODENAME") or "undefined"
if (node_name == "undefined") then
    LmodError("This package can only be loaded on a compute or transfer node. Please use a SLURM command (srun, sbatch, salloc) to a compute or transfer node.")
end

if (mode() == "load") then
    LmodMessage("Loading LIBD module for RSeQC/3.0.1")
elseif (mode() == "unload") then
    LmodMessage("Unloading LIBD module for RSeQC/3.0.1")
end

-- Directly activate or deactivate the conda environment. Here we directly
-- source conda-related code to circumvent the need for 'conda init', which is
-- user dependent
execute {cmd="source /jhpce/shared/jhpce/core/conda/miniconda3-23.3.1/etc/profile.d/conda.sh", modeA={"load"}}
execute {cmd="conda activate /jhpce/shared/libd/core/rseqc/3.0.1/rseqc_env", modeA={"load"}}
execute {cmd="conda deactivate", modeA={"unload"}}

-- This gives access to the physical python scripts
prepend_path("PATH", "/jhpce/shared/libd/core/rseqc/3.0.1/RSeQC-3.0.1/scripts")

-- Don't try to depend on user-installed python packages
setenv("PYTHONNOUSERSITE", "anything")
