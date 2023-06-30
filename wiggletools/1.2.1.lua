-- -*- lua -*-
-- vim:ft=lua:et:ts=4

help([[
This module loads WiggleTools version 1.2.1.
]])

whatis("WiggleTools")

if not string.match(os.getenv("HOSTNAME"),"compute") and not  string.match(os.getenv("HOSTNAME"),"transfer") then  
    LmodError("\
This package can only be loaded on a compute or transfer node. Please use qrsh to connect to a valid compute or transfer node.")
end

if (mode() == "load") then
    LmodMessage("Loading LIBD module for WiggleTools/1.2.1")
elseif (mode() == "unload") then
    LmodMessage("Unloading LIBD module for WiggleTools/1.2.1")
end

-- Directly activate or deactivate the conda environment containing the tool
execute {cmd="conda activate /jhpce/shared/libd/core/wiggletools/1.2.1/wiggle_env", modeA={"load"}}
execute {cmd="conda deactivate", modeA={"unload"}}
