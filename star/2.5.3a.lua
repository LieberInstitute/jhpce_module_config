-- -*- lua -*-
-- vim:ft=lua:et:ts=4

help([[
This module loads STAR version 2.5.3a.
]])

whatis("STAR")

if not string.match(os.getenv("HOSTNAME"),"compute") and not  string.match(os.getenv("HOSTNAME"),"transfer") then  
    LmodError("\
This package can only be loaded on a compute or transfer node. Please use qrsh to connect to a valid compute or transfer node.")
end

LmodMessage("Loading LIBD module for star/2.5.3a")
prepend_path("PATH", "/jhpce/shared/jhpce/libd/star/2.5.3a/STAR-2.5.3a/bin/Linux_x86_64_static")
