-- -*- lua -*-
-- vim:ft=lua:et:ts=4

help([[
This module loads bfg version 1.13.0.
]])

whatis("bfg")

if not string.match(os.getenv("HOSTNAME"),"compute") and not  string.match(os.getenv("HOSTNAME"),"transfer") then  
    LmodError("\
This package can only be loaded on a compute or transfer node. Please use qrsh to connect to a valid compute or transfer node.")
end

LmodMessage("Loading LIBD module for bfg/1.13.0")
prepend_path("PATH", "/jhpce/shared/libd/core/bfg/1.13.0")
LmodMessage("Use with `java -jar /jhpce/shared/libd/core/bfg/1.13.0/bfg.jar`")
