-- -*- lua -*-
-- vim:ft=lua:et:ts=4

help([[
This module loads Arioc version 1.51.
]])

if not string.match(os.getenv("HOSTNAME"),"compute") and not  string.match(os.getenv("HOSTNAME"),"transfer") then  
    LmodError("\
This package can only be loaded on a compute or transfer node. Please use qrsh to connect to a valid compute or transfer node.")
end

if (mode() == "load") then
    LmodMessage("Loading LIBD module for Arioc/1.51")
elseif (mode() == "unload") then
    LmodMessage("Unloading LIBD module for Arioc/1.51")
end

load("gcc/5.5.0")
prepend_path("PATH", "/jhpce/shared/jhpce/libd/arioc/1.51/bin")
