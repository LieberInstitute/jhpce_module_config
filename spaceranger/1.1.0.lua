-- -*- lua -*-
-- vim:ft=lua:et:ts=4

help([[
This module loads space ranger version 1.1.0.
]])

if not string.match(os.getenv("HOSTNAME"),"compute") and not  string.match(os.getenv("HOSTNAME"),"transfer") then  
    LmodError("\
This package can only be loaded on a compute or transfer node. Please use qrsh to connect to a valid compute or transfer node.")
end

LmodMessage("Loading LIBD module for spaceranger/1.1.0")
load('python/2.7')
prepend_path("PATH", "/jhpce/shared/jhpce/libd/spaceranger/1.1.0/spaceranger-1.1.0")
