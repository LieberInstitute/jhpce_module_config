-- -*- lua -*-
-- vim:ft=lua:et:ts=4

help([[
This module loads LDSC version 1.0.1.
]])

if not string.match(os.getenv("HOSTNAME"),"compute") and not  string.match(os.getenv("HOSTNAME"),"transfer") then  
    LmodError("\
This package can only be loaded on a compute or transfer node. Please use qrsh to connect to a valid compute or transfer node.")
end

LmodMessage("Loading LIBD SLURM module for LDSC/1.0.1")
load('python/3.7.3')
prepend_path("PATH", "/jhpce/shared/libd/core/ldsc/1.0.1/ldsc")
setenv('OPENBLAS_NUM_THREADS', 1)
