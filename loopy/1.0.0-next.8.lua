help([[
This module loads Loopy Browser v1.0.0-next.8.
]])

if not string.match(os.getenv("HOSTNAME"),"compute") and not  string.match(os.getenv("HOSTNAME"),"transfer") then  
    LmodError("\
This package can only be loaded on a compute or transfer node. Please use qrsh to connect to a valid compute or transfer node.")
end

if (mode() == "load") then
    LmodMessage("Loading LIBD module for loopy/1.0.0-next.8")
elseif (mode() == "unload") then
    LmodMessage("Unloading LIBD module for loopy/1.0.0-next.8")
end

-- Directly activate or deactivate the conda environment
execute {cmd="conda activate /jhpce/shared/libd/core/loopy/1.0.0-next.8/loopy_env", modeA={"load"}}
execute {cmd="conda deactivate", modeA={"unload"}}
