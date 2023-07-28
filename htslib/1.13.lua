-- -*- lua -*-
-- vim:ft=lua:et:ts=4

help([[
This module loads htslib version 1.13.
]])

whatis("htslib")

if not string.match(os.getenv("SLURMD_NODENAME"),"compute") and not  string.match(os.getenv("SLURMD_NODENAME"),"transfer") then  
    LmodError("\
This package can only be loaded on a compute or transfer node. Please use qrsh to connect to a valid compute or transfer node.")
end

LmodMessage("Loading LIBD module for htslib/1.13")
prepend_path("PATH", "/jhpce/shared/libd/core/htslib/1.13/bin")
prepend_path("MANPATH","/jhpce/shared/libd/core/htslib/1.13/share/man/man1")
prepend_path("LD_LIBRARY_PATH", "/jhpce/shared/libd/core/htslib/1.13/lib")
prepend_path("C_INCLUDE_PATH", "/jhpce/shared/libd/core/htslib/1.13/include")
prepend_path("LIBRARY_PATH", "/jhpce/shared/libd/core/htslib/1.13/lib")
prepend_path("PKG_CONFIG_PATH", "/jhpce/shared/libd/core/htslib/1.13/lib/pkgconfig")