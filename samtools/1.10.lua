-- -*- lua -*-
-- vim:ft=lua:et:ts=4

help([[
This module loads samtools version 1.10.
]])

whatis("samtools")

if not string.match(os.getenv("HOSTNAME"),"compute") and not  string.match(os.getenv("HOSTNAME"),"transfer") then  
    LmodError("\
This package can only be loaded on a compute or transfer node. Please use qrsh to connect to a valid compute or transfer node.")
end

if (mode() == "load") then
    LmodMessage("Loading LIBD SLURM module for samtools/1.10")
elseif (mode() == "unload") then
    LmodMessage("Unloading LIBD SLURM module for samtools/1.10")
end

prepend_path("PATH", "/jhpce/shared/libd/core/samtools/1.10/bin")
prepend_path("MANPATH", "/jhpce/shared/libd/core/samtools/1.10/share/man/man1")
