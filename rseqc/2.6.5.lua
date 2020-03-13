-- -*- lua -*-
-- vim:ft=lua:et:ts=4

help([[
This module loads RSeQC version 2.6.5.
]])

whatis("RSeQC")

if not string.match(os.getenv("HOSTNAME"),"compute") and not  string.match(os.getenv("HOSTNAME"),"transfer") then  
    LmodError("\
This package can only be loaded on a compute or transfer node. Please use qrsh to connect to a valid compute or transfer node.")
end

LmodMessage("Loading LIBD module for RSeQC/2.6.5")
load('python/2.7')
prepend_path("PYTHONPATH", "/jhpce/shared/jhpce/libd/rseqc/2.6.5/RSeQC-2.6.5/bin//jhpce/shared/jhpce/core/python/2.7.9/lib/python2.7/site-packages")
prepend_path("PATH", "/jhpce/shared/jhpce/libd/rseqc/2.6.5/RSeQC-2.6.5/bin//jhpce/shared/jhpce/core/python/2.7.9/bin/")
