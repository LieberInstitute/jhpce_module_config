-- -*- lua -*-
-- vim:ft=lua:et:ts=4

help([[
This module loads rmate version 1.5.10.
]])

whatis("rmate")

if not string.match(os.getenv("HOSTNAME"),"compute") and not  string.match(os.getenv("HOSTNAME"),"transfer") then  
    LmodError("\
This package can only be loaded on a compute or transfer node. Please use qrsh to connect to a valid compute or transfer node.")
end

LmodMessage("Loading LIBD SLURM module for rmate/1.5.10")
load('ruby/3.2.2')
prepend_path("PATH", "/jhpce/shared/libd/core/rmate/1.5.10/rmate/bin")
