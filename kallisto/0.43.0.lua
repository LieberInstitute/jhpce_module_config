-- -*- lua -*-
-- vim:ft=lua:et:ts=4

help([[
This module loads kallisto version 0.43.0.
]])

whatis("kallisto")

if not string.match(os.getenv("HOSTNAME"),"compute") and not  string.match(os.getenv("HOSTNAME"),"transfer") then  
    LmodError("\
This package can only be loaded on a compute or transfer node. Please use qrsh to connect to a valid compute or transfer node.")
end

LmodMessage("Loading LIBD module for kallisto/0.43.0")
prepend_path("PATH", "/jhpce/shared/jhpce/libd/kallisto/0.43.0/kallisto_linux-v0.43.0/kallisto")
