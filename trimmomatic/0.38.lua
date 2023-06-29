-- -*- lua -*-
-- vim:ft=lua:et:ts=4

help([[
This module loads Trimmomatic version 0.38.
]])

whatis("Trimmomatic")

if not string.match(os.getenv("HOSTNAME"),"compute") and not  string.match(os.getenv("HOSTNAME"),"transfer") then  
    LmodError("\
This package can only be loaded on a compute or transfer node. Please use qrsh to connect to a valid compute or transfer node.")
end

LmodMessage("Loading LIBD module for Trimmomatic/0.38")
prepend_path("PATH", "/jhpce/shared/libd/core/Trimmomatic/0.38/Trimmomatic-0.38")
prepend_path("PATH", "/jhpce/shared/libd/core/Trimmomatic/0.38/Trimmomatic-0.38/adapters")
