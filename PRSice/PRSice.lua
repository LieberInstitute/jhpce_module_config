
-- -*- lua -*-
-- vim:ft=lua:et:ts=4

help([[
This module loads PRSice version 2.2.8.
]])

whatis("PRSice")

if not string.match(os.getenv("HOSTNAME"),"compute") and not  string.match(os.getenv("HOSTNAME"),"transfer") then  
    LmodError("\
This package can only be loaded on a compute or transfer node. Please use qrsh to connect to a valid compute or transfer node.")
end

LmodMessage("Loading LIBD module for PRSice/v2.2.8")
prepend_path("PATH", "/jhpce/shared/jhpce/libd/PRSice/v2.2.8")