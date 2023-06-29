-- -*- lua -*-
-- vim:ft=lua:et:ts=4

help([[
This module loads featureCounts version 1.6.3.
]])

whatis("featureCounts")

if not string.match(os.getenv("HOSTNAME"),"compute") and not  string.match(os.getenv("HOSTNAME"),"transfer") then  
    LmodError("\
This package can only be loaded on a compute or transfer node. Please use qrsh to connect to a valid compute or transfer node.")
end

LmodMessage("Loading LIBD module for featureCounts/1.6.3")
prepend_path("PATH", "/jhpce/shared/libd/core/subread/1.6.3/subread-1.6.3-Linux-x86_64/bin")
