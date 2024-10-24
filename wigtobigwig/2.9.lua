-- -*- lua -*-
-- vim:ft=lua:et:ts=4

help([[
This module loads wigToBigWig (from UCSC tools) version 2.9.
]])

whatis("FastQC")

if not string.match(os.getenv("HOSTNAME"),"compute") and not  string.match(os.getenv("HOSTNAME"),"transfer") then  
    LmodError("\
This package can only be loaded on a compute or transfer node. Please use qrsh to connect to a valid compute or transfer node.")
end

if (mode() == "load") then
    LmodMessage("Loading LIBD SLURM module for wigToBigWig/2.9")
elseif (mode() == "unload") then
    LmodMessage("Unloading LIBD SLURM module for wigToBigWig/2.9")
end
prepend_path("PATH", "/jhpce/shared/libd/core/wigtobigwig/2.9")
