-- -*- lua -*-
-- vim:ft=lua:et:ts=4

help([[
This module loads WiggleTools version 1.2.1.
]])

whatis("WiggleTools")

if not string.match(os.getenv("SLURMD_NODENAME"),"compute") and not  string.match(os.getenv("SLURMD_NODENAME"),"transfer") then  
    LmodError("\
This package can only be loaded on a compute or transfer node. Please use qrsh to connect to a valid compute or transfer node.")
end

if (mode() == "load") then
    LmodMessage("Loading LIBD module for WiggleTools/1.2.1")
elseif (mode() == "unload") then
    LmodMessage("Unloading LIBD module for WiggleTools/1.2.1")
end

-- Directly activate or deactivate the conda environment. Here we directly
-- source conda-related code to circumvent the need for 'conda init', which is
-- user dependent
execute {cmd="source /jhpce/shared/jhpce/core/conda/miniconda3-23.3.1/etc/profile.d/conda.sh", modeA={"load"}}
execute {cmd="conda activate /jhpce/shared/libd/core/wiggletools/1.2.1/wiggle_env", modeA={"load"}}
execute {cmd="conda deactivate", modeA={"unload"}}
