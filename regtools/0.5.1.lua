-- -*- lua -*-
-- vim:ft=lua:et:ts=4

help([[
This module loads regtools version 0.5.1.
]])

whatis("regtools")

if not string.match(os.getenv("HOSTNAME"),"compute") and not  string.match(os.getenv("HOSTNAME"),"transfer") then  
    LmodError("\
This package can only be loaded on a compute or transfer node. Please use qrsh to connect to a valid compute or transfer node.")
end

LmodMessage("Loading LIBD module for regtools/0.5.1")
prepend_path("PATH", "/jhpce/shared/libd/core/regtools/0.5.1/regtools-0.5.1/build")
