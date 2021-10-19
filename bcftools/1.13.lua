-- -*- lua -*-
-- vim:ft=lua:et:ts=4

help([[
This module loads BCFTools version 1.13, including the additional 'gtc2vcf' and 'affy2vcf' plugins.
]])

whatis("BCFTools")

if not string.match(os.getenv("HOSTNAME"),"compute") and not  string.match(os.getenv("HOSTNAME"),"transfer") then  
    LmodError("\
This package can only be loaded on a compute or transfer node. Please use qrsh to connect to a valid compute or transfer node.")
end

LmodMessage("Loading LIBD module for BCFTools/1.13")
prepend_path("PATH", "/jhpce/shared/jhpce/libd/bcftools/1.13/bin")
prepend_path("MANPATH","/jhpce/shared/jhpce/libd/bcftools/1.13/share/man/man1")
setenv("BCFTOOLS_PLUGINS", "/jhpce/shared/jhpce/libd/bcftools/1.13/bcftools-1.13/plugins")
