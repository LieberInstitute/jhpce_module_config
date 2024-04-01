-- -*- lua -*-
-- vim:ft=lua:et:ts=4

help([[
This module loads STAR version 2.7.8a.
]])

whatis("STAR")

if not string.match(os.getenv("HOSTNAME"),"compute") and not  string.match(os.getenv("HOSTNAME"),"transfer") then  
    LmodError("\
This package can only be loaded on a compute or transfer node. Please use qrsh to connect to a valid compute or transfer node.")
end

if (mode() == "load") then
    LmodMessage("Loading LIBD SLURM module for star/2.7.8a")
elseif (mode() == "unload") then
    LmodMessage("Unloading LIBD SLURM module for star/2.7.8a")
end

prepend_path("PATH", "/jhpce/shared/libd/core/star/2.7.8a/STAR-2.7.8a/bin/Linux_x86_64_static")
