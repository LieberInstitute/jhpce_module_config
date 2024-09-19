-- -*- lua -*-
-- vim:ft=lua:et:ts=4

help([[This module loads qctool 2.2.5.]])

if not string.match(os.getenv("HOSTNAME"),"compute") and not  string.match(os.getenv("HOSTNAME"),"transfer") then  
    LmodError("\
This package can only be loaded on a compute or transfer node. Please use srun to connect to a valid compute or transfer node.")
end

if (mode() == "load") then
    LmodMessage("Loading LIBD SLURM module for qctool/2.25")
elseif (mode() == "unload") then
    LmodMessage("Unloading LIBD SLURM module for qctool/2.25")
end

prepend_path("PATH", "/jhpce/shared/libd/core/qctool/2.2.5/qctool_v2.2.5-Ce-x86_64")
