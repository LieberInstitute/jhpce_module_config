-- -*- lua -*-
-- vim:ft=lua:et:ts=4

help([[
This module loads samtools version 1.17.
]])

whatis("samtools")

if not string.match(os.getenv("HOSTNAME"),"compute") and not  string.match(os.getenv("HOSTNAME"),"transfer") then  
    LmodError("\
This package can only be loaded on a compute or transfer node. Please use qrsh to connect to a valid compute or transfer node.")
end

if (mode() == "load") then
    LmodMessage("Loading LIBD module for samtools/1.17")
elseif (mode() == "unload") then
    LmodMessage("Unloading LIBD module for samtools/1.17")
end

prepend_path("PATH", "/jhpce/shared/jhpce/libd/samtools/1.17/bin")
prepend_path("MANPATH", "/jhpce/shared/jhpce/libd/samtools/1.17/share/man/man1")
