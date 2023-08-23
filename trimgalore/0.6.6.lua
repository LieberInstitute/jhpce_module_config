help([[
This module loads Trim Galore version 0.6.6 (cutadapt version 3.4).
]])

-- Check if the env var SLURMD_NODENAME exists to indirectly verify if a user
-- is on a compute or transfer node
node_name = os.getenv("SLURMD_NODENAME") or "undefined"
if (node_name == "undefined") then
    LmodError("This package can only be loaded on a compute or transfer node. Please use a SLURM command (srun, sbatch, salloc) to a compute or transfer node.")
end

LmodMessage("Loading LIBD module for trimgalore/0.6.6")

load('fastqc/0.11.8')
prepend_path("PYTHONPATH", "/jhpce/shared/libd/core/trimgalore/0.6.6/cutadapt/bin/lib/python3.7/site-packages")
prepend_path("PATH", "/jhpce/shared/libd/core/trimgalore/0.6.6/cutadapt/bin/bin")
prepend_path("PATH", "/jhpce/shared/libd/core/trimgalore/0.6.6/TrimGalore-0.6.6")
