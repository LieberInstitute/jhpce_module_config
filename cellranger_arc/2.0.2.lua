-- -*- lua -*-
-- vim:ft=lua:et:ts=4

help([[
This module loads cellranger-arc 2.0.2.
]])

if not string.match(os.getenv("SLURMD_NODENAME"),"compute") and not  string.match(os.getenv("SLURMD_NODENAME"),"transfer") then  
    LmodError("\
This package can only be loaded on a compute or transfer node. Please use qrsh to connect to a valid compute or transfer node.")
end

if (mode() == "load") then
    LmodMessage("Loading LIBD module for cellranger_arc/2.0.2")
    LmodMessage("Reference files, for use with the '--transcriptome' argument, can be accessed or downloaded into /dcs04/lieber/lcolladotor/annotationFiles_LIBD001/10x.")
elseif (mode() == "unload") then
    LmodMessage("Unloading LIBD module for cellranger_arc/2.0.2")
end

prepend_path("PATH", "/jhpce/shared/libd/core/cellranger_arc/2.0.2/cellranger-arc-2.0.2")
