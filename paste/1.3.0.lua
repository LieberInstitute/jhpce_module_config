help([[
This module loads paste 1.3.0 for python 3.8.3.
]])

if not string.match(os.getenv("HOSTNAME"),"compute") and not  string.match(os.getenv("HOSTNAME"),"transfer") then  
    LmodError("\
This package can only be loaded on a compute or transfer node. Please use qrsh to connect to a valid compute or transfer node.")
end

if (mode() == "load") then
    LmodMessage("Loading LIBD SLURM module for paste/1.3.0")
elseif (mode() == "unload") then
    LmodMessage("Unloading LIBD SLURM module for paste/1.3.0")
end

load('python/3.8.3')

-- Directly activate or deactivate the python virtual environment
execute {cmd="source /jhpce/shared/libd/core/paste/1.3.0/paste_venv/bin/activate", modeA={"load"}}
execute {cmd="deactivate", modeA={"unload"}}

-- Don't try to depend on user-installed python packages
setenv("PYTHONNOUSERSITE", "anything")
