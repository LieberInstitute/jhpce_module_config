-- -*- lua -*-
-- vim:ft=lua:et:ts=4

help([[
This module loads HISAT2 version 2.2.0. The python scripts included in the HISAT2-2.2.0 build binary were updated to python 3 compatibility using 2to3, a python 3 program. The original versions of the py$
]])

whatis("HISAT2")

if not string.match(os.getenv("HOSTNAME"),"compute") and not  string.match(os.getenv("HOSTNAME"),"transfer") then
    LmodError("\
This package can only be loaded on a compute or transfer node. Please use qrsh to connect to a valid compute or transfer node.")
end

LmodMessage("Loading LIBD module for HISAT2/2.2.0_python3")
prepend_path("PATH", "/jhpce/shared/libd/core/hisat2/2.2.0_python3/hisat2-2.2.0")

