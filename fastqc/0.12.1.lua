-- -*- lua -*-
-- vim:ft=lua:et:ts=4

help([[
This module loads FastQC version 0.12.1.
]])

whatis("FastQC")

if not string.match(os.getenv("HOSTNAME"),"compute") and not  string.match(os.getenv("HOSTNAME"),"transfer") then  
    LmodError("\
This package can only be loaded on a compute or transfer node. Please use qrsh to connect to a valid compute or transfer node.")
end

if (mode() == "load") then
    LmodMessage("Loading LIBD module for FastQC/0.12.1")
elseif (mode() == "unload") then
    LmodMessage("Unloading LIBD module for FastQC/0.12.1")
end
prepend_path("PATH", "/jhpce/shared/jhpce/libd/FastQC/0.12.1/FastQC")
