help([[This module loads tensorQTL 1.0.8 for python 3.9.0 and R 4.2.0.]])

if not string.match(os.getenv("HOSTNAME"),"compute") and not  string.match(os.getenv("HOSTNAME"),"transfer") then  
    LmodError("\
This package can only be loaded on a compute or transfer node. Please use qrsh to connect to a valid compute or transfer node.")
end

if (mode() == "load") then
    LmodMessage("Loading LIBD SLURM module for tensorQTL/1.0.8")
elseif (mode() == "unload") then
    LmodMessage("Unloading LIBD SLURM module for tensorQTL/1.0.8")
end

-- Directly activate or deactivate the conda environment
always_load("conda/3-23.3.1")
execute {cmd="conda activate /jhpce/shared/libd/core/tensorqtl/1.0.8/tensorqtl_env", modeA={"load"}}
execute {cmd="conda deactivate", modeA={"unload"}}

-- Don't try to depend on user-installed python packages
setenv("PYTHONNOUSERSITE", "anything")
