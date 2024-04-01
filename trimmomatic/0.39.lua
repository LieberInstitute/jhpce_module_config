-- -*- lua -*-
-- vim:ft=lua:et:ts=4

help([[
This module loads Trimmomatic version 0.39.
]])

whatis("Trimmomatic")

if not string.match(os.getenv("HOSTNAME"),"compute") and not  string.match(os.getenv("HOSTNAME"),"transfer") then  
    LmodError("\
This package can only be loaded on a compute or transfer node. Please use qrsh to connect to a valid compute or transfer node.")
end

if (mode() == "load") then
    LmodMessage("Loading LIBD SLURM module for Trimmomatic/0.39")
elseif (mode() == "unload") then
    LmodMessage("Unloading LIBD SLURM module for Trimmomatic/0.39")
end

prepend_path("PATH", "/jhpce/shared/libd/core/Trimmomatic/0.39/Trimmomatic-0.39")
prepend_path("PATH", "/jhpce/shared/libd/core/Trimmomatic/0.39/Trimmomatic-0.39/adapters")
