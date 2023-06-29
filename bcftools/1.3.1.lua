-- -*- lua -*-
-- vim:ft=lua:et:ts=4

help([[
This module loads BCFTools version 1.3.1.
]])

whatis("BCFTools")

if not string.match(os.getenv("HOSTNAME"),"compute") and not  string.match(os.getenv("HOSTNAME"),"transfer") then  
    LmodError("\
This package can only be loaded on a compute or transfer node. Please use qrsh to connect to a valid compute or transfer node.")
end

LmodMessage("Loading LIBD module for BCFTools/1.3.1")
prepend_path("PATH", "/jhpce/shared/libd/core/bcftools/1.3.1/bin/bin")
prepend_path("MANPATH","/jhpce/shared/libd/core/bcftools/1.3.1/bin/share/man/man1")

