help([[
This module loads RESEPT version 1.0.0 and python 3.7.3.
]])

-- Check if the env var SLURMD_NODENAME exists to indirectly verify if a user
-- is on a compute or transfer node
node_name = os.getenv("SLURMD_NODENAME") or "undefined"
if (node_name == "undefined") then
    LmodError("This package can only be loaded on a compute or transfer node. Please use a SLURM command (srun, sbatch, salloc) to a compute or transfer node.")
end

LmodMessage("Loading LIBD SLURM module for resept/1.0.0")
LmodMessage("Note: python scripts should be invoked using 'which':")
LmodMessage("    'python $(which RGB_images_pipeline.py)', rather than:")
LmodMessage("    'python RGB_images_pipeline.py'.")

load('python/3.7.3')
prepend_path("PATH", "/jhpce/shared/libd/core/resept/1.0.0/RESEPT/scGNNsp_space")
prepend_path("PATH", "/jhpce/shared/libd/core/resept/1.0.0/RESEPT")
prepend_path("PATH", "/jhpce/shared/libd/core/resept/1.0.0/resept_venv/bin")
