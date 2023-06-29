-- -*- lua -*-
-- vim:ft=lua:et:ts=4

help([[
This module loads GTEx pipeline QTL scripts.
]])

whatis("qtl_gtex")

if not string.match(os.getenv("HOSTNAME"),"compute") and not  string.match(os.getenv("HOSTNAME"),"transfer") then
    LmodError("\
This package can only be loaded on a compute or transfer node. Please use qrsh to connect to a valid compute or transfer node.")
end

LmodMessage("Loading LIBD module for qtl_gtex")
load("python/3.7.3")
prepend_path("PATH", "/jhpce/shared/libd/core/gtex-pipeline/dae3369/gtex-pipeline/qtl/src")
