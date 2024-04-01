help([[This module loads tangram 1.0.4 for python 3.8.5.]])

if not string.match(os.getenv("HOSTNAME"),"compute") and not  string.match(os.getenv("HOSTNAME"),"transfer") then  
    LmodError("\
This package can only be loaded on a compute or transfer node. Please use qrsh to connect to a valid compute or transfer node.")
end

if (mode() == "load") then
    LmodMessage("Loading LIBD SLURM module for tangram/1.0.4")
elseif (mode() == "unload") then
    LmodMessage("Unloading LIBD SLURM module for tangram/1.0.4")
end

-- Directly activate or deactivate the conda environment
always_load("conda/3-23.3.1")
execute {cmd="conda deactivate", modeA={"load"}}
execute {cmd="conda activate /jhpce/shared/libd/core/tangram/1.0.4/tangram_env", modeA={"load"}}
execute {cmd="conda deactivate", modeA={"unload"}}

-- Don't try to depend on user-installed python packages
setenv("PYTHONNOUSERSITE", "anything")
