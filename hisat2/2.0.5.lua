-- -*- lua -*-
-- vim:ft=lua:et:ts=4

help([[
This module loads HISAT2 version 2.0.5.
]])

whatis("HISAT2")

if not string.match(os.getenv("HOSTNAME"),"compute") and not  string.match(os.getenv("HOSTNAME"),"transfer") then  
    LmodError("\
This package can only be loaded on a compute or transfer node. Please use qrsh to connect to a valid compute or transfer node.")
end

LmodMessage("Loading LIBD module for HISAT2/2.0.5")
prepend_path("PATH", "/jhpce/shared/libd/core/hisat2/2.0.5/hisat2-2.0.5")
