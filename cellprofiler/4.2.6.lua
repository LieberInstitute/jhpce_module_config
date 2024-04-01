help([[
This module loads Cellprofiler 4.2.6 (intended for headless use).
]])

if not string.match(os.getenv("HOSTNAME"),"compute") and not  string.match(os.getenv("HOSTNAME"),"transfer") then  
    LmodError("\
This package can only be loaded on a compute or transfer node. Please use qrsh to connect to a valid compute or transfer node.")
end

if (mode() == "load") then
    LmodMessage("Loading LIBD SLURM module for cellprofiler/4.2.6")
elseif (mode() == "unload") then
    LmodMessage("Unloading LIBD SLURM module for cellprofiler/4.2.6")
end

-- Directly activate or deactivate the conda environment
always_load("conda/3-23.3.1")
execute {cmd="conda activate /jhpce/shared/libd/core/cellprofiler/4.2.6/cellprofiler_env", modeA={"load"}}
execute {cmd="conda deactivate", modeA={"unload"}}

-- Don't try to depend on user-installed python packages
setenv("PYTHONNOUSERSITE", "anything")
