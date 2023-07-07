help([[
This module loads Samui Browser v1.0.0-next.45.
]])

if not string.match(os.getenv("HOSTNAME"),"compute") and not  string.match(os.getenv("HOSTNAME"),"transfer") then  
    LmodError("\
This package can only be loaded on a compute or transfer node. Please use qrsh to connect to a valid compute or transfer node.")
end

if (mode() == "load") then
    LmodMessage("Loading LIBD module for samui/1.0.0-next.45")
elseif (mode() == "unload") then
    LmodMessage("Unloading LIBD module for samui/1.0.0-next.45")
end

-- Directly activate or deactivate the conda environment
execute {cmd="conda activate /jhpce/shared/libd/core/samui/1.0.0-next.45/samui_env", modeA={"load"}}
execute {cmd="conda deactivate", modeA={"unload"}}

-- Seems to be necessary for finding python scripts from the Samui repo
append_path('PYTHONPATH', '/jhpce/shared/libd/core/samui/1.0.0-next.45/samui')
