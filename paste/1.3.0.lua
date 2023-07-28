help([[
This module loads paste 1.3.0 for python 3.8.3.
]])

if not string.match(os.getenv("SLURMD_NODENAME"),"compute") and not  string.match(os.getenv("SLURMD_NODENAME"),"transfer") then  
    LmodError("\
This package can only be loaded on a compute or transfer node. Please use qrsh to connect to a valid compute or transfer node.")
end

if (mode() == "load") then
    LmodMessage("Loading LIBD module for paste/1.3.0")
elseif (mode() == "unload") then
    LmodMessage("Unloading LIBD module for paste/1.3.0")
end

load('python/3.8.3')

-- Directly activate or deactivate the python virtual environment
execute {cmd="source /jhpce/shared/libd/core/paste/1.3.0/paste_venv/bin/activate", modeA={"load"}}
execute {cmd="deactivate", modeA={"unload"}}
