help([[
This module loads Loopy Browser v1.0.0-next.15.
]])

if not string.match(os.getenv("HOSTNAME"),"compute") and not  string.match(os.getenv("HOSTNAME"),"transfer") then  
    LmodError("\
This package can only be loaded on a compute or transfer node. Please use qrsh to connect to a valid compute or transfer node.")
end

if (mode() == "load") then
    LmodMessage("Loading LIBD module for loopy/1.0.0-next.15")
elseif (mode() == "unload") then
    LmodMessage("Unloading LIBD module for loopy/1.0.0-next.15")
end

-- Directly activate or deactivate the conda environment
execute {cmd="conda activate /jhpce/shared/jhpce/libd/loopy/1.0.0-next.15/samui_env", modeA={"load"}}
execute {cmd="conda deactivate", modeA={"unload"}}
