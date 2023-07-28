-- -*- lua -*-
-- vim:ft=lua:et:ts=4

help([[
This module loads plink version 1.90b6.6.
]])

whatis("plink")

if not string.match(os.getenv("SLURMD_NODENAME"),"compute") and not  string.match(os.getenv("SLURMD_NODENAME"),"transfer") then  
    LmodError("\
This package can only be loaded on a compute or transfer node. Please use qrsh to connect to a valid compute or transfer node.")
end

LmodMessage("Loading LIBD module for plink/1.90b6.6")
prepend_path("PATH", "/jhpce/shared/libd/core/plink/1.90b6.6")
