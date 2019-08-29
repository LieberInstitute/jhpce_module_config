-- -*- lua -*-
-- vim:ft=lua:et:ts=4

help([[
This module loads rmate version 1.5.9.
]])

whatis("rmate")

if not string.match(os.getenv("HOSTNAME"),"compute") and not  string.match(os.getenv("HOSTNAME"),"transfer") then  
    LmodError("\
This package can only be loaded on a compute or transfer node. Please use qrsh to connect to a valid compute or transfer node.")
end

LmodMessage("Loading LIBD module for rmate/1.5.9")
load('ruby/2.6.4p104')
prepend_path("PATH", "/jhpce/shared/jhpce/libd/rmate/1.5.9/rmate/bin")
