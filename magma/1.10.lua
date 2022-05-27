-- -*- lua -*-
-- vim:ft=lua:et:ts=4

help([[
This module loads MAGMA version 1.10.
]])

if not string.match(os.getenv("HOSTNAME"),"compute") and not  string.match(os.getenv("HOSTNAME"),"transfer") then  
    LmodError("\
This package can only be loaded on a compute or transfer node. Please use qrsh to connect to a valid compute or transfer node.")
end

if (mode() == "load") then
    LmodMessage("Loading LIBD module for magma/1.10")
elseif (mode() == "unload") then
    LmodMessage("Unloading LIBD module for magma/1.10")
end

prepend_path("PATH", "/jhpce/shared/jhpce/libd/magma/1.10")
