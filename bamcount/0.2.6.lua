-- -*- lua -*-
-- vim:ft=lua:et:ts=4

help([[
This module loads bamcount version 0.2.6
]])

whatis("bamcount")

if not string.match(os.getenv("HOSTNAME"),"compute") and not  string.match(os.getenv("HOSTNAME"),"transfer") then  
    LmodError("\
This package can only be loaded on a compute or transfer node. Please use qrsh to connect to a valid compute or transfer node.")
end

LmodMessage("Loading LIBD module for bamcount/0.2.6")
load('wiggletools/1.2.1')
prepend_path("PATH", "/jhpce/shared/jhpce/libd/bamcount/0.2.6")
