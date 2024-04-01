-- -*- lua -*-
-- vim:ft=lua:et:ts=4

help([[This module loads plink version 2.00 Alpha 4.6.]])

whatis("plink")

if not string.match(os.getenv("HOSTNAME"),"compute") and not  string.match(os.getenv("HOSTNAME"),"transfer") then  
    LmodError("\
This package can only be loaded on a compute or transfer node. Please use qrsh to connect to a valid compute or transfer node.")
end

if (mode() == "load") then
    LmodMessage("Loading LIBD SLURM module for plink/2.00a4.6")
    LmodMessage("Plink is invoked with the command 'plink2'.")
elseif (mode() == "unload") then
    LmodMessage("Unloading LIBD SLURM module for plink/2.00a4.6")
end

prepend_path("PATH", "/jhpce/shared/libd/core/plink/2.00a4.6")
