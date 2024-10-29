help([[
This module loads HERGAST 0.0.1.
]])

if not string.match(os.getenv("HOSTNAME"),"compute") and not  string.match(os.getenv("HOSTNAME"),"transfer") then  
    LmodError("\
This package can only be loaded on a compute or transfer node. Please use srun to connect to a valid compute or transfer node.")
end

if (mode() == "load") then
    LmodMessage("Loading LIBD SLURM module for hergast/0.0.1")
elseif (mode() == "unload") then
    LmodMessage("Unloading LIBD SLURM module for hergast/0.0.1")
end

-- Directly activate or deactivate the conda environment
always_load("conda/3-24.3.0")
execute {cmd="conda activate /jhpce/shared/libd/core/hergast/0.0.1/hergast_env", modeA={"load"}}
execute {cmd="conda deactivate", modeA={"unload"}}

-- Don't try to depend on user-installed python packages
setenv("PYTHONNOUSERSITE", "anything")
