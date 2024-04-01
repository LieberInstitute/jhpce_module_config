-- -*- lua -*-
-- vim:ft=lua:et:ts=4

help([[
This module loads bs version 1.3.0.
]])

whatis("bs")

if not string.match(os.getenv("HOSTNAME"),"compute") and not  string.match(os.getenv("HOSTNAME"),"transfer") then  
    LmodError("\
This package can only be loaded on a compute or transfer node. Please use qrsh to connect to a valid compute or transfer node.")
end

LmodMessage("Loading LIBD SLURM module for bs/1.3.0")
prepend_path("PATH", "/jhpce/shared/libd/core/bs/1.3.0/bin")
