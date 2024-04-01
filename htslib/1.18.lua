-- -*- lua -*-
-- vim:ft=lua:et:ts=4

help([[
This module loads htslib version 1.18.
]])

whatis("htslib")

if not string.match(os.getenv("HOSTNAME"),"compute") and not  string.match(os.getenv("HOSTNAME"),"transfer") then  
    LmodError("\
This package can only be loaded on a compute or transfer node. Please use qrsh to connect to a valid compute or transfer node.")
end

if (mode() == "load") then
    LmodMessage("Loading LIBD SLURM module for htslib/1.18")
elseif (mode() == "unload") then
    LmodMessage("Unloading LIBD SLURM module for htslib/1.18")
end

prepend_path("PATH", "/jhpce/shared/libd/core/htslib/1.18/bin")
prepend_path("MANPATH","/jhpce/shared/libd/core/htslib/1.18/share/man/man1")
prepend_path("LD_LIBRARY_PATH", "/jhpce/shared/libd/core/htslib/1.18/lib")
prepend_path("C_INCLUDE_PATH", "/jhpce/shared/libd/core/htslib/1.18/include")
prepend_path("LIBRARY_PATH", "/jhpce/shared/libd/core/htslib/1.18/lib")
prepend_path("PKG_CONFIG_PATH", "/jhpce/shared/libd/core/htslib/1.18/lib/pkgconfig")
