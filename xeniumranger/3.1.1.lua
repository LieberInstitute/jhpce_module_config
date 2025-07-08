-- -*- lua -*-
-- vim:ft=lua:et:ts=4

help([[
This module loads Xenium Ranger version 3.1.1.
]])

if not string.match(os.getenv("HOSTNAME"),"compute") and not  string.match(os.getenv("HOSTNAME"),"transfer") then  
    LmodError("\
This package can only be loaded on a compute or transfer node. Please use qrsh to connect to a valid compute or transfer node.")
end

if (mode() == "load") then
    LmodMessage("Loading LIBD SLURM module for xeniumranger/3.1.1")
    LmodMessage("Reference files, for use with the '--transcriptome' argument, can be accessed or downloaded into /dcs04/lieber/lcolladotor/annotationFiles_LIBD001/10x.")
elseif (mode() == "unload") then
    LmodMessage("Unloading LIBD SLURM module for xeniumranger/3.1.1)
end

prepend_path("PATH", "/jhpce/shared/libd/core/xeniumranger/3.1.1/xeniumranger-3.1.1/bin")
