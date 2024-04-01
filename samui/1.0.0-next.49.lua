help([[
This module loads Samui Browser v1.0.0-next.49.
]])

if not string.match(os.getenv("HOSTNAME"),"compute") and not  string.match(os.getenv("HOSTNAME"),"transfer") then  
    LmodError("\
This package can only be loaded on a compute or transfer node. Please use qrsh to connect to a valid compute or transfer node.")
end

if (mode() == "load") then
    LmodMessage("Loading LIBD SLURM module for samui/1.0.0-next.49")
elseif (mode() == "unload") then
    LmodMessage("Unloading LIBD SLURM module for samui/1.0.0-next.49")
end

-- Directly activate or deactivate the conda environment
always_load("conda/3-23.3.1")
execute {cmd="conda activate /jhpce/shared/libd/core/samui/1.0.0-next.49/samui_env", modeA={"load"}}
execute {cmd="conda deactivate", modeA={"unload"}}

-- Seems to be necessary for finding python scripts from the Samui repo
append_path('PYTHONPATH', '/jhpce/shared/libd/core/samui/1.0.0-next.49/samui')

-- Don't try to depend on user-installed python packages
setenv("PYTHONNOUSERSITE", "anything")
