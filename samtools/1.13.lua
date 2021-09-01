-- -*- lua -*-
-- vim:ft=lua:et:ts=4

help([[
This module loads samtools version 1.13.
]])

whatis("samtools")

if not string.match(os.getenv("HOSTNAME"),"compute") and not  string.match(os.getenv("HOSTNAME"),"transfer") then  
    LmodError("\
This package can only be loaded on a compute or transfer node. Please use qrsh to connect to a valid compute or transfer node.")
end

LmodMessage("Loading LIBD module for samtools/1.13")
-- could be necessary (it's used on the core modules for samtools 1.0 and 1.1 but not on 1.6)
-- prereq("gcc/4.4.7")
prepend_path("PATH", "/jhpce/shared/jhpce/libd/samtools/1.13/bin")
prepend_path("MANPATH", "/jhpce/shared/jhpce/libd/samtools/1.13/share/man/man1")
