-- -*- lua -*-
-- vim:ft=lua:et:ts=4

help([[
This module loads regtools version 0.5.0.
]])

whatis("HISAT2")

if not string.match(os.getenv("HOSTNAME"),"compute") and not  string.match(os.getenv("HOSTNAME"),"transfer") then  
    LmodError("\
This package can only be loaded on a compute or transfer node. Please use qrsh to connect to a valid compute or transfer node.")
end

LmodMessage("Loading LIBD module for regtools/0.5.0")
prepend_path("PATH", "/jhpce/shared/jhpce/libd/regtools/0.5.0/regtools/build")
