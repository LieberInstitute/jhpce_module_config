-- -*- lua -*-
-- vim:ft=lua:et:ts=4

help([[
This module loads space ranger version 3.1.3
]])

if not string.match(os.getenv("HOSTNAME"),"compute") and not  string.match(os.getenv("HOSTNAME"),"transfer") then  
    LmodError("\
This package can only be loaded on a compute or transfer node. Please use srun to connect to a valid compute or transfer node.")
end

if (mode() == "load") then
    LmodMessage("Loading LIBD SLURM module for spaceranger/3.1.3")
    LmodMessage("Reference files, for use with the '--transcriptome' argument, can be accessed or downloaded into /dcs04/lieber/lcolladotor/annotationFiles_LIBD001/10x.")
elseif (mode() == "unload") then
    LmodMessage("Unloading LIBD SLURM module for spaceranger/3.1.3")
end

prepend_path("PATH", "/jhpce/shared/libd/core/spaceranger/3.1.3/spaceranger-3.1.3/bin")
