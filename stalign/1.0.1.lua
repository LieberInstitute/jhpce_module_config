help([[
This module loads STalign 1.0.1.
]])

if not string.match(os.getenv("HOSTNAME"),"compute") and not  string.match(os.getenv("HOSTNAME"),"transfer") then  
    LmodError("\
This package can only be loaded on a compute or transfer node. Please use qrsh to connect to a valid compute or transfer node.")
end

if (mode() == "load") then
    LmodMessage("Loading LIBD SLURM module for stalign/1.0.1")
elseif (mode() == "unload") then
    LmodMessage("Unloading LIBD SLURM module for stalign/1.0.1")
end

-- To make it easier to directly invoke python scripts in the repo
prepend_path('PATH', '/jhpce/shared/libd/core/stalign/1.0.1/STalign/STalign')

-- Directly activate or deactivate the conda environment
always_load("conda/3-23.3.1")
execute {cmd="conda activate /jhpce/shared/libd/core/stalign/1.0.1/stalign_env", modeA={"load"}}
execute {cmd="conda deactivate", modeA={"unload"}}

-- Don't try to depend on user-installed python packages
setenv("PYTHONNOUSERSITE", "anything")
