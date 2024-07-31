-- -*- lua -*-
-- vim:ft=lua:et:ts=4

help([[
This module loads Cell Ranger ATAC 2.1.0.
]])

if not string.match(os.getenv("HOSTNAME"),"compute") and not  string.match(os.getenv("HOSTNAME"),"transfer") then  
    LmodError("\
This package can only be loaded on a compute or transfer node. Please use qrsh to connect to a valid compute or transfer node.")
end

if (mode() == "load") then
    LmodMessage("Loading LIBD SLURM module for cellranger-atac/2.1.0")
elseif (mode() == "unload") then
    LmodMessage("Unloading LIBD SLURM module for cellranger-atac/2.1.0")
end

LmodMessage("Reference files can be accessed or downloaded into /dcs04/lieber/lcolladotor/annotationFiles_LIBD001/10x.")
prepend_path("PATH", "/jhpce/shared/libd/core/cellranger-atac/2.1.0/cellranger-atac-2.1.0")
