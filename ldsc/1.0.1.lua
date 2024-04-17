-- -*- lua -*-
-- vim:ft=lua:et:ts=4

help([[
This module loads bulik/ldsc version 1.0.1.
]])

if not string.match(os.getenv("HOSTNAME"),"compute") and not  string.match(os.getenv("HOSTNAME"),"transfer") then  
    LmodError("\
This package can only be loaded on a compute or transfer node. Please use qrsh to connect to a valid compute or transfer node.")
end

if (mode() == "load") then
    LmodMessage("Loading LIBD SLURM module for ldsc/1.0.1")
elseif (mode() == "unload") then
    LmodMessage("Unloading LIBD SLURM module for ldsc/1.0.1")
end

-- To make it easier to directly invoke python scripts in the repo
prepend_path("PATH", "/jhpce/shared/libd/core/ldsc/1.0.1/ldsc")

-- Directly activate or deactivate the conda environment
always_load("conda/3-23.3.1")
execute {cmd="conda activate /jhpce/shared/libd/core/ldsc/1.0.1/ldsc_env", modeA={"load"}}
execute {cmd="conda deactivate", modeA={"unload"}}

-- Don't try to depend on user-installed python packages
setenv("PYTHONNOUSERSITE", "anything")
