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
load('plink/1.90b6.6')
prepend_path("PATH", "/jhpce/shared/libd/core/fusion_twas/github/fusion_twas")

LmodMessage("See /jhpce/shared/libd/core/fusion_twas/github/README.md for installing the R dependencies")
LmodMessage("Run using the full path, for example: Rscript /jhpce/shared/libd/core/fusion_twas/github/fusion_twas/FUSION.compute_weights.R --help")
