help([[
This module loads synapse 2.7.2: namely, the command-line tool and python package.
]])

if not string.match(os.getenv("HOSTNAME"),"compute") and not  string.match(os.getenv("HOSTNAME"),"transfer") then  
    LmodError("\
This package can only be loaded on a compute or transfer node. Please use qrsh to connect to a valid compute or transfer node.")
end

if (mode() == "load") then
    LmodMessage("Loading LIBD SLURM module for synapse/2.7.2")
elseif (mode() == "unload") then
    LmodMessage("Unloading LIBD SLURM module for synapse/2.7.2")
end

-- Directly activate or deactivate the conda environment
always_load("conda/3-23.3.1")
execute {cmd="conda activate /jhpce/shared/libd/core/synapse/2.7.2/synapse_env", modeA={"load"}}
execute {cmd="conda deactivate", modeA={"unload"}}

-- Don't try to depend on user-installed python packages
setenv("PYTHONNOUSERSITE", "anything")
