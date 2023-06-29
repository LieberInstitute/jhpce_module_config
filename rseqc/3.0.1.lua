-- -*- lua -*-
-- vim:ft=lua:et:ts=4

help([[
This module loads RSeQC version 3.0.1.
]])

whatis("RSeQC")

if not string.match(os.getenv("HOSTNAME"),"compute") and not  string.match(os.getenv("HOSTNAME"),"transfer") then  
    LmodError("\
This package can only be loaded on a compute or transfer node. Please use qrsh to connect to a valid compute or transfer node.")
end

LmodMessage("Loading LIBD module for RSeQC/3.0.1")
load('python/3.7.3')
prepend_path("PYTHONPATH", "/jhpce/shared/libd/core/rseqc/3.0.1/RSeQC-3.0.1/bin//jhpce/shared/jhpce/core/python/3.7.3/lib/python3.7/site-packages")
prepend_path("PATH", "/jhpce/shared/libd/core/rseqc/3.0.1/RSeQC-3.0.1/bin//jhpce/shared/jhpce/core/python/3.7.3/bin/")
