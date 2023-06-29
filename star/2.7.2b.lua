-- -*- lua -*-
-- vim:ft=lua:et:ts=4

help([[
This module loads STAR version 2.7.2b.
]])

whatis("STAR")

if not string.match(os.getenv("HOSTNAME"),"compute") and not  string.match(os.getenv("HOSTNAME"),"transfer") then  
    LmodError("\
This package can only be loaded on a compute or transfer node. Please use qrsh to connect to a valid compute or transfer node.")
end

LmodMessage("Loading LIBD module for star/2.7.2b")
prepend_path("PATH", "/jhpce/shared/libd/core/star/2.7.2b/STAR-2.7.2b/bin/Linux_x86_64_static")
