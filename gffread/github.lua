-- -*- lua -*-
-- vim:ft=lua:et:ts=4

help([[
This module loads gffread version github [a3fd02f].
]])

whatis("gffread")

if not string.match(os.getenv("HOSTNAME"),"compute") and not  string.match(os.getenv("HOSTNAME"),"transfer") then  
    LmodError("\
This package can only be loaded on a compute or transfer node. Please use qrsh to connect to a valid compute or transfer node.")
end

LmodMessage("Loading LIBD module for gffread/github [a3fd02f]")
prepend_path("PATH", "/jhpce/shared/jhpce/libd/gffread/github/gffread")
