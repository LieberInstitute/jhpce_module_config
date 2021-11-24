-- -*- lua -*-
-- vim:ft=lua:et:ts=4

help([[
This module loads Arioc version 1.43.
]])

if not string.match(os.getenv("HOSTNAME"),"compute") and not  string.match(os.getenv("HOSTNAME"),"transfer") then  
    LmodError("\
This package can only be loaded on a compute or transfer node. Please use qrsh to connect to a valid compute or transfer node.")
end

LmodMessage("Loading LIBD module for Arioc/1.43")

load("gcc/5.5.0")
prepend_path("PATH", "/jhpce/shared/jhpce/libd/arioc/1.43/bin")
