help([[
This module loads Trim Galore version 0.6.6 (including FastQC 0.12.1 and Cutadapt version 4.0).
]])

-- Check if the env var SLURMD_NODENAME exists to indirectly verify if a user
-- is on a compute or transfer node
node_name = os.getenv("SLURMD_NODENAME") or "undefined"
if (node_name == "undefined") then
    LmodError("This package can only be loaded on a compute or transfer node. Please use a SLURM command (srun, sbatch, salloc) to a compute or transfer node.")
end

if (mode() == "load") then
    LmodMessage("Loading LIBD module for trimgalore/0.6.6")
elseif (mode() == "unload") then
    LmodMessage("Unloading LIBD module for trimgalore/0.6.6")
end

load('fastqc/0.12.1')

-- Directly activate or deactivate the conda environment for Cutadapt. Here we
-- directly source conda-related code to circumvent the need for 'conda init',
-- which is user dependent
execute {cmd="source /jhpce/shared/jhpce/core/conda/miniconda3-23.3.1/etc/profile.d/conda.sh", modeA={"load"}}
execute {cmd="conda activate /jhpce/shared/libd/core/trimgalore/0.6.6/cutadapt_env", modeA={"load"}}
execute {cmd="conda deactivate", modeA={"unload"}}

prepend_path("PATH", "/jhpce/shared/libd/core/trimgalore/0.6.6/TrimGalore-0.6.6")
