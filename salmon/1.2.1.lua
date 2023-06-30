-- -*- lua -*-
-- vim:ft=lua:et:ts=4

help([[
This module loads Salmon version 1.2.1.
]])

whatis("Salmon")

if not string.match(os.getenv("HOSTNAME"),"compute") and not  string.match(os.getenv("HOSTNAME"),"transfer") then  
    LmodError("\
This package can only be loaded on a compute or transfer node. Please use qrsh to connect to a valid compute or transfer node.")
end

if (mode() == "load") then
    LmodMessage("Loading LIBD module for Salmon/1.2.1")
elseif (mode() == "unload") then
    LmodMessage("Unloading LIBD module for Salmon/1.2.1")
end

prepend_path("PATH", "/jhpce/shared/libd/core/Salmon/1.2.1/salmon-latest_linux_x86_64/bin")
