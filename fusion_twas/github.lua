-- -*- lua -*-
-- vim:ft=lua:et:ts=4

help([[
This module loads fusion_twas version github (c677be0).
]])

whatis("HISAT2")

if not string.match(os.getenv("HOSTNAME"),"compute") and not  string.match(os.getenv("HOSTNAME"),"transfer") then  
    LmodError("\
This package can only be loaded on a compute or transfer node. Please use qrsh to connect to a valid compute or transfer node.")
end

LmodMessage("Loading LIBD module for fusion_twas/github")
prepend_path("PATH", "/jhpce/shared/jhpce/libd/fusion_twas/github/fusion_twas")
