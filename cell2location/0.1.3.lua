help([[
This module loads cell2location 0.1.3 for CUDA 11.3.
]])

if not string.match(os.getenv("HOSTNAME"),"compute") and not  string.match(os.getenv("HOSTNAME"),"transfer") then  
    LmodError("\
This package can only be loaded on a compute or transfer node. Please use qrsh to connect to a valid compute or transfer node.")
end

if (mode() == "load") then
    LmodMessage("Loading LIBD module for cell2location/0.1.3")
elseif (mode() == "unload") then
    LmodMessage("Unloading LIBD module for cell2location/0.1.3")
end

-- Directly activate or deactivate the conda environment
execute {cmd="conda activate /jhpce/shared/libd/core/cell2location/0.1.3/cell2location_env", modeA={"load"}}
execute {cmd="conda deactivate", modeA={"unload"}}