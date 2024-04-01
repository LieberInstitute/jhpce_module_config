help([[
This module loads 'r_nac', a conda environment for R designed for the spatialNAc project.
]])

if not string.match(os.getenv("HOSTNAME"),"compute") and not  string.match(os.getenv("HOSTNAME"),"transfer") then  
    LmodError("\
This package can only be loaded on a compute or transfer node. Please use qrsh to connect to a valid compute or transfer node.")
end

if (mode() == "load") then
    LmodMessage("Loading LIBD SLURM module for r_nac/1.0")
elseif (mode() == "unload") then
    LmodMessage("Unloading LIBD SLURM module for r_nac/1.0")
end

-- Directly activate or deactivate the conda environment
always_load("conda/3-23.3.1")
execute {cmd="conda activate /jhpce/shared/libd/core/r_nac/1.0/nac_env", modeA={"load"}}
execute {cmd="conda deactivate", modeA={"unload"}}
