
-- -*- lua -*-
-- vim:ft=lua:et:ts=4

help([[
This module loads qctools version 2.0.7
]])

whatis("qctool")

if not string.match(os.getenv("SLURMD_NODENAME"),"compute") and not  string.match(os.getenv("SLURMD_NODENAME"),"transfer") then  
    LmodError("\
This package can only be loaded on a compute or transfer node. Please use qrsh to connect to a valid compute or transfer node.")
end

LmodMessage("Loading LIBD module for qctool/2.0.7")
prepend_path("PATH", "/jhpce/shared/libd/core/qctool/2.0.7/qctool/build/release/")