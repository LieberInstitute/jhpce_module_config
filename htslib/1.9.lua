-- -*- lua -*-
-- vim:ft=lua:et:ts=4

help([[
This module loads htslib version 1.9.
]])

whatis("htslib")

if not string.match(os.getenv("HOSTNAME"),"compute") and not  string.match(os.getenv("HOSTNAME"),"transfer") then  
    LmodError("\
This package can only be loaded on a compute or transfer node. Please use qrsh to connect to a valid compute or transfer node.")
end

LmodMessage("Loading LIBD module for htslib/1.9")
prepend_path("PATH", "/jhpce/shared/jhpce/libd/htslib/1.9/bin")
prepend_path("MANPATH","/jhpce/shared/jhpce/libd/htslib/1.9/share/man/man1")
prepend_path("LD_LIBRARY_PATH", "/jhpce/shared/jhpce/libd/htslib/1.9/lib")
prepend_path("C_INCLUDE_PATH", "/jhpce/shared/jhpce/libd/htslib/1.9/include")
prepend_path("LIBRARY_PATH", "/jhpce/shared/jhpce/libd/htslib/1.9/lib")
prepend_path("PKG_CONFIG_PATH", "/jhpce/shared/jhpce/libd/htslib/1.9/lib/pkgconfig")