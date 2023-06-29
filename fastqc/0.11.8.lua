-- -*- lua -*-
-- vim:ft=lua:et:ts=4

help([[
This module loads FastQC version 0.11.8.
]])

whatis("FastQC")

if not string.match(os.getenv("HOSTNAME"),"compute") and not  string.match(os.getenv("HOSTNAME"),"transfer") then  
    LmodError("\
This package can only be loaded on a compute or transfer node. Please use qrsh to connect to a valid compute or transfer node.")
end

LmodMessage("Loading LIBD module for FastQC/0.11.8")
prepend_path("PATH", "/jhpce/shared/libd/core/FastQC/0.11.8/FastQC")
