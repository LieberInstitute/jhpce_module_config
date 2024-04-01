-- -*- lua -*-
-- vim:ft=lua:et:ts=4

help([[
This module loads samblaster v0.1.26.
]])

if not string.match(os.getenv("HOSTNAME"),"compute") and not  string.match(os.getenv("HOSTNAME"),"transfer") then  
    LmodError("\
This package can only be loaded on a compute or transfer node. Please use qrsh to connect to a valid compute or transfer node.")
end

if (mode() == "load") then
    LmodMessage("Loading LIBD SLURM module for samblaster/0.1.26")
elseif (mode() == "unload") then
    LmodMessage("Unloading LIBD SLURM module for samblaster/0.1.26")
end

prepend_path("PATH", "/jhpce/shared/libd/core/samblaster/0.1.26/samblaster-v.0.1.26")
