-- -*- lua -*-
-- vim:ft=lua:et:ts=4

help([[
This module loads bustools version 0.39.3.
]])

whatis("bustools")

if not string.match(os.getenv("HOSTNAME"),"compute") and not  string.match(os.getenv("HOSTNAME"),"transfer") then  
    LmodError("\
This package can only be loaded on a compute or transfer node. Please use qrsh to connect to a valid compute or transfer node.")
end

LmodMessage("Loading LIBD SLURM module for bustools/0.39.3")
prepend_path("PATH", "/jhpce/shared/libd/core/bustools/0.39.3/bustools")
