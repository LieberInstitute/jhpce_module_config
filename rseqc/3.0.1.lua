-- -*- lua -*-
-- vim:ft=lua:et:ts=4

help([[
This module loads RSeQC version 3.0.1.
]])

whatis("RSeQC")

if not string.match(os.getenv("HOSTNAME"),"compute") and not  string.match(os.getenv("HOSTNAME"),"transfer") then
    LmodError("\
This package can only be loaded on a compute or transfer node. Please use qrsh to connect to a valid compute or transfer node.")
end

if (mode() == "load") then
    LmodMessage("Loading LIBD module for RSeQC/3.0.1")
elseif (mode() == "unload") then
    LmodMessage("Unloading LIBD module for RSeQC/3.0.1")
end

-- Directly activate or deactivate the conda environment
execute {cmd="conda activate /jhpce/shared/libd/core/rseqc/3.0.1/rseqc_env", modeA={"load"}}
execute {cmd="conda deactivate", modeA={"unload"}}

-- This gives access to the physical python scripts
prepend_path("PATH", "/jhpce/shared/libd/core/rseqc/3.0.1/RSeQC-3.0.1/scripts")
