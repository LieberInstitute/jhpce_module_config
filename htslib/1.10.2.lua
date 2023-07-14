-- -*- lua -*-
-- vim:ft=lua:et:ts=4

help([[
This module loads htslib version 1.10.2.
]])

whatis("htslib")

if not string.match(os.getenv("HOSTNAME"),"compute") and not  string.match(os.getenv("HOSTNAME"),"transfer") then  
    LmodError("\
This package can only be loaded on a compute or transfer node. Please use qrsh to connect to a valid compute or transfer node.")
end

LmodMessage("Loading LIBD module for htslib/1.10.2")
prepend_path("PATH", "/jhpce/shared/libd/core/htslib/1.10.2/bin")
prepend_path("MANPATH","/jhpce/shared/libd/core/htslib/1.10.2/share/man/man1")
prepend_path("LD_LIBRARY_PATH", "/jhpce/shared/libd/core/htslib/1.10.2/lib")
prepend_path("C_INCLUDE_PATH", "/jhpce/shared/libd/core/htslib/1.10.2/include")
prepend_path("LIBRARY_PATH", "/jhpce/shared/libd/core/htslib/1.10.2/lib")
prepend_path("PKG_CONFIG_PATH", "/jhpce/shared/libd/core/htslib/1.10.2/lib/pkgconfig")
