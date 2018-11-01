-- -*- lua -*-
-- vim:ft=lua:et:ts=4

help([[
This module loads vcftools version 0.1.15.
]])

whatis("vcftools")

if not string.match(os.getenv("HOSTNAME"),"compute") and not  string.match(os.getenv("HOSTNAME"),"transfer") then  
    LmodError("\
This package can only be loaded on a compute or transfer node. Please use qrsh to connect to a valid compute or transfer node.")
end

LmodMessage("Loading LIBD module for vcftools/0.1.15")
prepend_path("PATH", "/jhpce/shared/jhpce/libd/vcftools/0.1.15/bin")
prepend_path("PERL5LIB", "/jhpce/shared/jhpce/libd/vcftools/0.1.15/jhpce/shared/jhpce/core/conda/miniconda-3/envs/svnR-3.5/lib/perl5/site_perl/5.20.3")
prepend_path("MANPATH", "/jhpce/shared/jhpce/libd/vcftools/0.1.15/share/man/man1")

