-- -*- lua -*-
-- vim:ft=lua:et:ts=4

help([[This module loads plink version 1.90 beta]])

whatis("plink")

if not string.match(os.getenv("HOSTNAME"),"compute") and not  string.match(os.getenv("HOSTNAME"),"transfer") then  
    LmodError("\
This package can only be loaded on a compute or transfer node. Please use qrsh to connect to a valid compute or transfer node.")
end

if (mode() == "load") then
    LmodMessage("Loading LIBD SLURM module for plink/1.90b")
    LmodMessage("Plink 1.9 is invoked with the command 'plink'.")
elseif (mode() == "unload") then
    LmodMessage("Unloading LIBD SLURM module for plink/1.90b")
end

prepend_path("PATH", "/jhpce/shared/libd/core/plink/1.90b")
