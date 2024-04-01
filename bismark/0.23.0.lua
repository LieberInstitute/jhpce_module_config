-- -*- lua -*-
-- vim:ft=lua:et:ts=4

help([[This module loads bismark 0.23.0.]])

if not string.match(os.getenv("HOSTNAME"),"compute") and not  string.match(os.getenv("HOSTNAME"),"transfer") then  
    LmodError("\
This package can only be loaded on a compute or transfer node. Please use qrsh to connect to a valid compute or transfer node.")
end

if (mode() == "load") then
    LmodMessage("Loading LIBD SLURM module for bismark/0.23.0")
elseif (mode() == "unload") then
    LmodMessage("Unloading LIBD SLURM module for bismark/0.23.0")
end

prepend_path("PATH", "/jhpce/shared/libd/core/bismark/0.23.0/Bismark-0.23.0")
